WurlEngine::Engine.routes.draw do
  root :to => 'wurls#new'
  resources :wurls, :except => [:index]
  match '/:id' => 'wurls#show', :as => :short_wurl
end
