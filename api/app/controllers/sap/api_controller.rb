# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class Sap::ApiController < Sap::BaseController

  # Don't render layout
  layout false

  # Only JSON response
  respond_to :json

  # Catch all exeptions
  rescue_from Exception, :with => :render_error

  protected

  private
  # -------------------------------------------------------------
  # Error handler
  # -------------------------------------------------------------
  def render_error(exception)
    render_jsend :error => exception.message, :status => 500, :data => nil
    logger.error(exception)
    #notify_airbrake(exception)
  end

end