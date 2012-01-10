module WhurlEngine
  class ParameterDefinition < ActiveRecord::Base
    belongs_to :resource

    validates_presence_of :name
  end
end