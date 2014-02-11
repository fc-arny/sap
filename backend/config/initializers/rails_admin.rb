RailsAdmin.config do |config|
  config.main_app_name = %W(Globo Backend)
  config.main_app_name = Proc.new { |controller| [ 'GloboMarket', "Backend - #{controller.params[:action].try(:titleize)}" ] }

  # Auth
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.role
  end
  config.current_user_method &:current_user

  config.authorize_with :cancan, Sap::Backend::Ability


  config.excluded_models = [Sap::Measure, Sap::Address::Subject]
  #config.audit_with :paper_trail, 'Sap::User', 'PaperTrail::Version'
  #c.authenticate_with {}
  #c.current_user_method { User.first }
  #c.authorize_with :cancan
  #c.audit_with :history, User
end