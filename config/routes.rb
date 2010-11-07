ActionController::Routing::Routes.draw do |map|
  map.root :controller => "commands", :action => 'new'

  #legacy routes
  map.whurls 'whurls', :controller => 'commands', :action => 'edit'
  map.edit_whurl_commands 'whurls/commands/edit', :controller => 'commands', :action => 'edit'

end
