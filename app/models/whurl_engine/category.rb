module WhurlEngine
  class Category < ActiveRecord::Base
    validates_presence_of :name
  end
end
