require 'json'
require 'coderay'
require 'httparty'

module HTTParty
  class Response < HTTParty::BasicObject
    class Headers
      def to_s
        headers = []
        each_capitalized do |name, value|
          headers << "#{name}: #{value}"
        end
        headers.join("\n")
      end

      def to_html(options = {:line_numbers => nil})
        ::CodeRay.scan(to_s, :txt).div(options)
      end
    end

    def to_html(options = {:line_numbers => :table})
      return "<pre>(Empty)</pre>" unless body.present?
      case content_type
        when /xml/
          ::CodeRay.scan(body, :xml).div(options)
        when /html/
          ::CodeRay.scan(body, :html).div(options)
        when /json|javascript/
          ::CodeRay.scan(JSON.pretty_generate(JSON.parse(body)), :json).div(options)
        when /image|jpg|jpeg|gif|png|bmp|binary/
          "<img src=\"data:binary/octet;base64,#{Base64.encode64(response.body)}\" />"
        else
          body
      end
    end
  end
end
