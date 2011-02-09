ActionController::Routing::Routes.draw do |map|
  map.root :controller => "whurls", :action => 'new'

  map.resources :whurls
end
