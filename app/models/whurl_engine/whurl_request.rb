module WhurlEngine
  class WhurlRequest < ActiveRecord::Base
    serialize :data
    serialize :query, Hash
    serialize :headers, Hash

    after_initialize {
      default_values
      generate_hash_key if new_record?
    }

    validates_uniqueness_of :custom_url, :if => Proc.new { |model| !model.custom_url.blank? }
    validates_format_of :custom_url, :allow_blank => true, :allow_nil => true, :with => /^[\w\-]+$/i, :message => "can only contain letters, numbers, hyphens and underscores."

    scope :saved, where("custom_url IS NOT NULL AND custom_url <> ''").order(:custom_url)

    def slug
      hash_key || custom_url
    end

    private
    def default_values
      self.query ||= {}
      self.headers ||= {}
    end

    def generate_hash_key
      upper_bound = 36**6 -1 #max 6 characters
      new_hash_key = rand(upper_bound).to_s(36)
      if new_hash_key.match(/^whurl/)
        generate_hash_key
      else
        self.hash_key = new_hash_key
      end
    end
  end
end
