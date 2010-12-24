class Resource < ActiveRecord::Base
  serialize :formats
  serialize :parameters
  serialize :headers
end