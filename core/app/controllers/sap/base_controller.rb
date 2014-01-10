# -------------------------------------------------------------
#  Base controller for all controllers
# -------------------------------------------------------------
class Sap::BaseController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  # Sanitiser params for devise controllers
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :login, :password, :phone) }
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:name, :is_temporary) }
    devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:name, :password) }
  end

  def miniprofiler
    Rack::MiniProfiler.authorize_request # if user.admin?
  end
end
