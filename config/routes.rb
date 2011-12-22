WhurlEngine::Engine.routes.draw do
  root :to => 'whurl_requests#new'
  resources :whurl_requests
  match '/:slug' => 'whurl_requests#edit', :as => :short
end
