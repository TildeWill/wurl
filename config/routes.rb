WhurlApp::Application.routes.draw do
  root :to => 'whurls#new'
  resources :whurls
  match '/:id' => 'whurls#edit', :as => :short
end
