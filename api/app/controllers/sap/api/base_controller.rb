require_dependency 'sap/api/controller_setup'
# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::Api::BaseController < Sap::BaseController

  include Sap::Api::ControllerSetup

  layout '/sap/layouts/api'

  respond_to :json

  prepend_before_filter :fetch_auth_token

  before_filter :skip_trackable, :default_response_format

  # Catch all exceptions
  rescue_from Exception, with: :render_error

  protected

  def current_order
    order = Sap::Order.where('id = ? AND state = ?', session[:order_id], :new).first if session[:order_id].blank?
    order.blank? ? nil : order
    Sap::Order.first # TODO:debug
  end

  def default_response_format
    request.format = :json
  end

  # Error handler
  def render_error(exception)
    self.response_body = nil
    @error = exception.message + "\nTrace:\n\t" + exception.backtrace.join("\n\t    ")
    @status = 500
    logger.error(exception)
    #notify_airbrake(exception)
  end

  # Fetch auth token value from header
  def fetch_auth_token
    request.params[:auth_token] = auth_token
  end

  # Auth every request
  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

  # Authenticate user
  def authenticate_user

  end

  # Get auth token
  def auth_token
    request.headers['X-SAP-AUTH-TOKEN'] || params[:auth_token]
  end

  helper_method :auth_token

  # Render empty
  def render_empty
    render :file => '/sap/api/common/empty'
  end

  # Set response params: message, status and data
  def set_response_params(*params)
    @message = params[:message] || ''
    @status  = params[:status]  || :success
    @data    = params[:data]    || nil
    @errors  = params[:errors]  || []
  end

  # Set form error
  def set_form_error(errors, form_name = 'form')
    @errors ||= {}
    @errors[form_name] = errors
  end

end