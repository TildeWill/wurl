require 'coderay'
require 'httparty'

module HTTParty
  class Response < HTTParty::BasicObject
    def html(options = {:line_numbers => :table})
    case content_type
      when /xml/
        CodeRay.scan(body, :xml).div(options)
      when /html/
        CodeRay.scan(body, :html).div(options)
      when /json|javascript/
        CodeRay.scan(JSON.pretty_generate(JSON.parse(body)), :json).div(options)
      when /image|jpg|jpeg|gif|png|bmp|binary/
        "<img src=\"data:binary/octet;base64,#{Base64.encode64(response.body)}\" />"
      else
        body
    end
  end
  end
end