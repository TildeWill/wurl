module WhurlEngine
  class Category < ActiveRecord::Base
    validates_presence_of :name

    has_many :resources
  end
end
