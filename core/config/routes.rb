Sap::Core::Engine.routes.draw do
  # Devise
  devise_for :user,
     :class_name => 'Sap::User',
     :controllers => {
       registrations: 'sap/api/v1/user',
       sessions: 'sap/api/v1/user_sessions',
       passwords: 'sap/api/v1/user_passwords'
     },
     :skip => [:unlocks, :omniauth_callbacks],
     :path_names => { sign_out: 'logout', sign_in: 'auth', sign_up: 'register' },
     :path_prefix => 'api/v1'
end
