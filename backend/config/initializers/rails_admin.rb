RailsAdmin.config do |config|
  config.main_app_name = %W(GloboMarket Backend)

  # Auth
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.role
  end
  config.current_user_method &:current_user
  config.authorize_with :cancan, Sap::Backend::Ability
  config.included_models += [Sap::Store, Sap::User, Sap::Order, Sap::Good, Sap::GoodItem, Sap::Category]
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
    #show_in_app

    nestable do
      visible do
        [Sap::Store].include? bindings[:abstract_model].model
      end
    end
  end
end