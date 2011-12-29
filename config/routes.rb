WhurlEngine::Engine.routes.draw do
  root :to => 'requests#new'
  resources :requests
  match '/:slug' => 'requests#edit', :as => :short
end
