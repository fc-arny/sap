Sap::Core::Engine.routes.draw do
    # API
    namespace :api do
      # API v1.0
      namespace :v1 do
        resources :stores         # Stores
        resources :categories     # Categories

        # Goods
        #resources :goods
        #
        #resources :items, :controller => :items

        resources :goods

        scope :good do
          resources :items, :controller => :good_items, :as => 'good_items'
        end

        # Order
        resources :orders do
          resources :items, :controller => 'order_items'
        end

        # User
        resource :sessions, :only => [:creaate, :destroy]
        #namespace :user do
        #  post :auth, :action => :auth
        #end
      end
    end

    devise_for :user,
     :class_name => 'Sap::User',
     :controllers => {
       sessions: 'sap/api/v1/sessions',
       registrations: 'sap/api/v1/user',
       passwords: 'sap/passwords'
     },
     :skip => [:unlocks, :omniauth_callbacks],
     :path_names => { sign_out: 'logout', sign_in: 'auth', sign_up: 'register' },
     :path_prefix => 'api/v1'



end
