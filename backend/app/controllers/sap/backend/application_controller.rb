class Sap::Backend::ApplicationController < Sap::BaseController
  before_action :authenticate_user!
  before_action :restrict_access

  layout '/sap/backend/layouts/application'

  private

  # Restrict access
  def restrict_access
    raise ActionController::RoutingError, 'Page not found'  unless current_user.role
  end
end