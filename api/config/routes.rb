Sap::Core::Engine.routes.draw do
    # API
    namespace :api do
      # API v1.0
      namespace :v1 do


        resources :stores         # Stores
        resources :categories     # Categories

        # Goods
        scope shallow_path: 'good' do
          resources :goods do
            resources :items, :shallow => true, :controller => 'good_items'
            collection do
              get 'list', :action => :list
            end
          end
        end

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
