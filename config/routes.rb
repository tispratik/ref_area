ActionController::Routing::Routes.draw do |map|
  
  resources :decodes
  resources :countries, :regions, :cities
  
end
