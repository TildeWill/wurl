require 'coderay'
require 'json'

class String
  #this implementation should be coming in Rails 3.2
  def pluralize(count = nil)
    if count == 1
      self
    else
      ActiveSupport::Inflector.pluralize(self)
    end
  end

  def headerize
    split(/-/).map {|s| s.capitalize }.join('-')
  end

  def to_html(content_type, options = {:line_numbers => :table})
    begin
      case content_type
        when /xml/
          ::CodeRay.scan(self, :xml).div(options)
        when /html/
          ::CodeRay.scan(self, :html).div(options)
        when /json|javascript/
          ::CodeRay.scan(::JSON.pretty_generate(::JSON.parse(self)), :json).div(options)
        when /image|jpg|jpeg|gif|png|bmp|binary/
          "<img src=\"data:binary/octet;base64,#{Base64.encode64(response.body)}\" />"
        else
          self
      end

    rescue
      self
    end
  end
end