require 'coderay'
require 'curb'

class Command
  attr_reader :url
  attr_reader :http_method
  attr_reader :param_keys
  attr_reader :param_values
  attr_reader :header_keys
  attr_reader :header_values

#    validates_inclusion_of :http_method, :in => %w(GET POST PUT DELETE)
#    validates_format_of :url, :with => URI::regexp(%w(http https))

  def initialize(args = {})
    @url           = args[:url]
    @http_method   = args[:http_method]
    @param_keys    = args[:param_keys]
    @param_values  = args[:param_values]
    @header_keys   = args[:header_keys]
    @header_values = args[:header_values]
    data           = []
    if param_keys
      param_keys.each_with_index do |key, i|
        data << "#{key}=#{param_values[i]}" if key.present?
      end
    end

    @data    = data.join("&")
    @command = make_command(url, @data)
    case http_method
      when "POST"
        @command.post_body = @data
      when "PUT"
        @command.put_data = @data
    end

    @command.useragent = "Whurl/1.0"

    if header_keys
      header_keys.each_with_index do |key, i|
        @command.headers[key] = header_values[i] if key.present?
      end
    end
  end

  def send_request
    if http_method == "PUT"
      @command.send("http_#{http_method.downcase}", @data)
    else
      @command.send("http_#{http_method.downcase}")
    end
  end

  def body_str
    @command.body_str
  end

  def header_str
    @command.header_str
  end

  def response_html(options = {:line_numbers => :table})
    case @command.content_type
      when /xml/
        CodeRay.scan(@command.body_str, :xml).div(options)
      when /html/
        CodeRay.scan(@command.body_str, :html).div(options)
      when /json|javascript/
        CodeRay.scan(JSON.pretty_generate(JSON.parse(@command.body_str)), :json).div(options)
      when /jpg|jpeg|gif|png|bmp|binary/
        "<img src=\"data:binary/octet;base64,#{Base64.encode64(@command.body_str)}\" />"
      else
        @command.body_str
    end
  end

  def header_html
    CodeRay.scan(@command.header_str, :txt).div(:line_numbers => nil)
  end

  protected
  def make_command(url, data)
    if ["GET", "DELETE"].include?(http_method)
      if url.include?("?")
        @command = Curl::Easy.new(url + "&" + data)
      else
        @command = Curl::Easy.new(url + "?" + data)
      end
    else
      @command = Curl::Easy.new(url)
    end
  end
end