require 'httmultiparty'
require "whurl_engine/version"

module WhurlEngine
  class Whurl < ActiveRecord::Base
    serialize :request_parameters, Hash
    serialize :request_headers, ::HTTParty::Response::Headers
    serialize :response_headers, ::HTTParty::Response::Headers

    after_initialize :default_values
    before_create :make_request

    belongs_to :resource

    def to_param
      hash_key
    end

    private

    class AnyClient
      include HTTMultiParty
      #debug_output $stderr
    end

    def make_request
      request_params = {
        :headers => request_headers.to_hash,
        :query => request_parameters.blank? ? nil : request_parameters,
        :body => request_body,
        :follow_redirects => false
      }

      if basic_auth_user.present? && basic_auth_password.present?
        request_params.merge!({:basic_auth => { :username => basic_auth_user, :password => basic_auth_password }})
      end

      response = AnyClient.send(request_method.downcase, request_url, request_params)
      self.response_message = "HTTP/#{response.http_version} #{response.code} #{Rack::Utils::HTTP_STATUS_CODES[response.code]}"
      self.response_content_type = response.content_type
      self.response_body = response.body
      self.response_headers = response.headers
      self.raw_request = response.request.to_s
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
