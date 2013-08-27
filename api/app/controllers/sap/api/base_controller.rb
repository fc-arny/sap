require_dependency 'sap/api/controller_setup'
# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::Api::BaseController < ActionController::Base

  include Sap::Api::ControllerSetup

  layout '/sap/layouts/api'

  # Only JSON response
  respond_to :json


  prepend_before_filter :fetch_auth_token
  before_filter :authenticate_user
  before_filter :skip_trackable



  # Catch all exceptions
  rescue_from Exception, :with => :render_error

  protected
    # Error handler
    def render_error(exception)
      render_jsend :error => exception.message, :status => 500, :data => nil
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


end