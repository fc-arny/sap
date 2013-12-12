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

  # API
  namespace :api do
    # API v1.0
    namespace :v1 do
      resources :stores         # Stores
      resources :categories     # Categories
      resources :addresses      # User addresses


      resources :goods

      # User phones
      resources :phones do
        post :reset, on: :collection
      end

      scope :good do
        resources :items, :controller => :good_items, :as => 'good_items'
      end

      # Order
      resources :orders do
        resources :items, :controller => 'order_items'
      end

      #devise_scope :user do
      #  post '/password/recover' => 'user_passwords#create', :as => :reset_password
      #  put '/password/change' => 'user_passwords#update', :as => :update_password
      #end

    end
  end
end
