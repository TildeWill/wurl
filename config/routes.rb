WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :categories, :except => :show
  resources :parameter_definitions, :except => [:index, :show]
  resources :whurls
  resources :resources, :except => :index
  match '/:id' => 'whurls#show', :as => :short_whurl
end
