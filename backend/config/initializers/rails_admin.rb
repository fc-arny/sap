RailsAdmin.config do |config|
  config.main_app_name = %W(GloboMarket Backend)

  # Auth
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.role
  end
  config.current_user_method &:current_user

  config.authorize_with :cancan, Sap::Backend::Ability


  config.excluded_models = [Sap::Measure, Sap::Address::Subject, Rack::MiniProfiler]
end