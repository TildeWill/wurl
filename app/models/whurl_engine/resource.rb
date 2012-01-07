module WhurlEngine
  class Resource < ActiveRecord::Base
    belongs_to :category
    has_many :parameters
    validates_presence_of :base_uri, :relative_path
  end
end