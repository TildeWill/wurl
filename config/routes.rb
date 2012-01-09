WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :categories, :except => :show
  resources :parameters, :except => [:index, :show]
  resources :requests
  resources :resources, :except => :index
  match '/:slug' => 'requests#show', :as => :short
end
