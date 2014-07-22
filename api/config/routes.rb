Sap::Core::Engine.routes.draw do
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
      resources :order_items
      resources :orders


      #devise_scope :user do
      #  post '/password/recover' => 'user_passwords#create', :as => :reset_password
      #  put '/password/change' => 'user_passwords#update', :as => :update_password
      #end

    end
  end
end
