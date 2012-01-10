WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :categories, :except => :show
  resources :parameter_definitions, :except => [:index, :show]
  resources :whurls
  resources :resources, :except => :index
  match '/:hash_key' => 'whurls#show', :as => :short
end
