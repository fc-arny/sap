Sap::Core::Engine.routes.draw do
  scope module: 'backend' do
    namespace :admin do
      get '/' => 'index#index'
      resources :stores
      resources :orders
      resources :users
    end
  end
end