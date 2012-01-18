module WhurlEngine
  class HeaderDefinition < ActiveRecord::Base
    belongs_to :resource

    validates_presence_of :name
  end
end