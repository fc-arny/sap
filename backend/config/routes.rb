Sap::Core::Engine.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  #scope 'admin', module: 'backend', as: 'admin' do
  #  root to:  'index#index'
  #  resources :stores
  #  resources :orders
  #  resources :users
  #end
end