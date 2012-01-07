WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :requests
  resources :resources, :except => :index
  resources :categories, :except => :show
  match '/:slug' => 'requests#edit', :as => :short
end
