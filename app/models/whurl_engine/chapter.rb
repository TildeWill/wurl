module WhurlEngine
  class Chapter < ActiveRecord::Base
    belongs_to :whurl, :primary_key => :hash_key
    belongs_to :story
  end
end