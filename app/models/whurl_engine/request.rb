require 'httmultiparty'
require "whurl_engine/version"

module WhurlEngine
  class Request < ActiveRecord::Base
    serialize :data
    serialize :query, Hash
    serialize :headers, Hash

    after_initialize :default_values

    scope :saved, where("custom_url IS NOT NULL AND custom_url <> ''").order(:custom_url)

    def slug
      hash_key || custom_url
    end

    def response
      return @response unless @response.nil?
      @response = AnyClient.send(http_method.downcase,
                                 url,
                                 :headers => {'User-Agent' => "Whurl/#{WhurlEngine::VERSION} (https://github.com/tildewill/whurl_engine)"}.merge(headers),
                                 :query => query.blank? ? nil : query,
                                 :body => body
      )

    end

    def to_s
      response.request.to_s
    end

    def to_curl
      ret_str = "curl \"#{url}\" --include --request #{http_method.upcase}"
      headers.each do |k, v|
        ret_str << " -H #{k}:#{v}"
      end
      if ['put', 'post'].include?(http_method.downcase)
        ret_str << " --data \"#{body}\""
      end

      ret_str << " --head" if http_method.downcase == 'head'
      ret_str
    end

    private

    class AnyClient
      include HTTMultiParty
      #debug_output $stderr
    end

    def default_values
      generate_hash_key if new_record?
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
