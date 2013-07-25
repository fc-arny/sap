# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::Api::BaseController < ActionController::Base

  # Only JSON response
  respond_to :json

  # Helpers
  helper_method :response_jsend

  # Catch all exceptions
  rescue_from Exception, :with => :render_error



  protected
    # -------------------------------------------------------------
    # Error handler
    # -------------------------------------------------------------
    def render_error(exception)
      render_jsend :error => exception.message, :status => 500, :data => nil
      logger.error(exception)
      #notify_airbrake(exception)
    end

    # -------------------------------------------------------------
    # JSend api response
    #
    # @param [Jbuilder] json is JBuilder object
    # @param [Hash] params for jsend response
    # -------------------------------------------------------------
    def response_jsend(json, params = {})
      status  = params[:status] || :success
      message = params[:message] || nil

      json.status status
      json.message message
      json.data do
        yield if block_given?
      end
  end

end