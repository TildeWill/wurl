module WhurlEngine
  class Category < ActiveRecord::Base
    validates_presence_of :name

    has_many :resources, :order => :relative_path
  end
end
