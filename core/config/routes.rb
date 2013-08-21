Sap::Core::Engine.routes.draw do
  devise_for :auths, :class_name => 'Sap::Auth'
end
