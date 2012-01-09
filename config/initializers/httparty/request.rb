require 'httparty'

module HTTParty
  class Request
    def to_s
      @raw_request.to_s
    end

    def to_curl
      "curl"
    end
  end
end
