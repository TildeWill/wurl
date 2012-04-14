WhurlEngine::Engine.routes.draw do
  root :to => 'whurls#new'
  resources :whurls, :except => [:index]
  match '/:id' => 'whurls#show', :as => :short_whurl
end
