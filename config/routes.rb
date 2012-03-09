WhurlEngine::Engine.routes.draw do
  root :to => 'categories#index'
  resources :categories, :except => :show
  resources :parameter_definitions, :except => [:index, :show]
  resources :header_definitions, :except => [:index, :show]
  resources :whurls, :except => [:index]
  resources :resources, :except => :index
  resources :chapters, :except => [:index, :show]
  resources :stories, :except => :show
  match '/:id' => 'whurls#show', :as => :short_whurl
end
