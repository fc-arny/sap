require_dependency 'sap/api/controller_setup'
# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::Api::BaseController < ApplicationController

  include Sap::Api::ControllerSetup

  layout '/sap/layouts/api'

  # Only JSON response
  respond_to :json

  prepend_before_filter :fetch_auth_token

  before_filter :skip_trackable
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Catch all exceptions
  rescue_from Exception, :with => :render_error

  protected

  # Error handler
  def render_error(exception)
    self.response_body = nil
    msg = exception.message + "\nTrace:\n\t" + exception.backtrace.join("\n\t    ")
    render_jsend :error => msg, :status => 500, :data => nil
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

  # Sanitiser params for devise controllers
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :login, :password, :phone) }
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:name, :is_temporary) }
    devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:name, :password) }
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