require File.join(File.dirname(__FILE__), 'lib/engines_helper/rails_extensions/asset_helpers')

# If the app is using Haml/Sass, propagate sass directories too
config.after_initialize do
  EnginesHelper::Assets.propagate if EnginesHelper.autoload_assets
  EnginesHelper::Assets.update_sass_directories 
end
