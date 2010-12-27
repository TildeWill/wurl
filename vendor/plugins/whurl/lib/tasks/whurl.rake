namespace :whurl do
  desc "Copies the assets (js, css, images, migrations) to the parent project"
  task :copy_assets do
    require File.expand_path(File.dirname(__FILE__) + '../../../install.rb')
  end
end