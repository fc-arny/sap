# Base controller for all controllers
class Sap::BaseController < ActionController::Base


  private

  def miniprofiler
    Rack::MiniProfiler.authorize_request # if user.admin?
  end


end
