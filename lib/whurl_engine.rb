require 'whurl_engine/engine'
require 'whurl_engine/config'
require 'whurl_engine/extension'
require 'whurl_engine/extensions/cancan'

module WhurlEngine
  def self.config(&block)
    if block_given?
      block.call(WhurlEngine::Config)
    else
      WhurlEngine::Config
    end
  end
end
