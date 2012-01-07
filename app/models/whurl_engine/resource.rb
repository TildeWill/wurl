module WhurlEngine
  class Resource < ActiveRecord::Base
    belongs_to :category

    validates_presence_of :base_uri, :relative_path
  end
end