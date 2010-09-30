ActionController::Routing::Routes.draw do |map|
  map.root :controller => "whurl/commands", :action => 'edit'
  map.whurls 'whurls', :controller => 'whurl/commands', :action => 'edit'
end
