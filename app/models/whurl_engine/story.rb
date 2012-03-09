module WhurlEngine
  class Story < ActiveRecord::Base
    has_many :chapters
  end
end