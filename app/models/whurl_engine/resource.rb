module WhurlEngine
  class Resource < ActiveRecord::Base
    belongs_to :category
    has_many :parameter_definitions
    has_many :whurls
    validates_presence_of :base_uri, :relative_path

    def url
      File.join(base_uri, relative_path)
    end
  end
end