require 'haml'

module WurlEngine
  class Engine < Rails::Engine
    isolate_namespace WurlEngine
  end
end
