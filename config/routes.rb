ActionController::Routing::Routes.draw do |map|
  map.root :controller => "commands", :action => 'new'
#  map.new_whurl '/new', :controller => 'commands', :action => 'new'
  map.commands '/edit', :controller => 'commands', :action => 'edit'
end
