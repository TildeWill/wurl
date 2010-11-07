ActionController::Routing::Routes.draw do |map|
  map.root :controller => "commands", :action => 'new'
  map.resource 'commands'
#  map.whurls 'whurls', :controller => 'whurl/commands', :action => 'edit'
#  map.namespace(:whurl) do |whurl|
#    whurl.resource :commands
#  end
end
