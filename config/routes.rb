ActionController::Routing::Routes.draw do |map|
  map.resources :decodes

  
  map.resources :countries, :regions, :cities
  
end
