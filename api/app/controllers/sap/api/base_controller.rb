# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::Api::BaseController < ActionController::Base

  layout 'application'

  # Only JSON response
  respond_to :json

  # Catch all exceptions
  rescue_from Exception, :with => :render_error



  protected
    # Error handler
    def render_error(exception)
      render_jsend :error => exception.message, :status => 500, :data => nil
      logger.error(exception)
      #notify_airbrake(exception)
    end
end