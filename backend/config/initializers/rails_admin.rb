RailsAdmin.config do |config|
  config.main_app_name = %W(GloboMarket Backend)

  # Auth
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.role
  end
  config.current_user_method &:current_user
  config.authorize_with :cancan, Sap::Backend::Ability
  config.included_models += [Sap::Store, Sap::User, Sap::Order, Sap::Good]
  config.audit_with :paper_trail, 'Sap::User', 'PaperTrail::Version'

  # Actions
  config.actions do
    # root actions
    dashboard
    #root :habr

    # collection actions
    index
    new
    export
    history_index
    bulk_delete

    # member actions
    show
    edit
    delete
    history_show
  end
end