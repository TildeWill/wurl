WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :requests
  resources :categories
  match '/:slug' => 'requests#edit', :as => :short
end
