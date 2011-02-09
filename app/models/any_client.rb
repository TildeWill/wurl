require 'json/pure'
require 'coderay'
require 'httmultiparty'

class AnyClient
  include HTTMultiParty

  def self.response_html(response, options = {:line_numbers => :table})
    case response.content_type
      when /xml/
        CodeRay.scan(response.body, :xml).div(options)
      when /html/
        CodeRay.scan(response.body, :html).div(options)
      when /json|javascript/
        CodeRay.scan(JSON.pretty_generate(JSON.parse(response.body)), :json).div(options)
      when /jpg|jpeg|gif|png|bmp|binary/
        "<img src=\"data:binary/octet;base64,#{Base64.encode64(response.body)}\" />"
      else
        response.body
    end
  end
end