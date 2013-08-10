Sap::Core::Engine.routes.draw do
    # API
    namespace :api do
      # API v1.0
      namespace :v1 do


        resources :stores         # Stores
        resources :categories     # Categories

        # Goods
        resources :goods
        namespace :good  do
          resources :items, :controller => :items
        end
        #scope shallow_path: 'good' do
        #  resources :goods do
        #    resources :items, only: [:index], :shallow => true
        #
        #  end
        #end

        # Order
        resources :orders do
          resources :items, :controller => 'order_items'
        end

        # User
        resources :user do
          post 'auth', :on => :collection
        end
      end
    end
end
