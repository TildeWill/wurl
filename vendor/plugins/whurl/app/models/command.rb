require 'json/pure'
require 'coderay'
require 'curb'

class Command < ActiveRecord::Base
  serialize :param_keys, Array
  serialize :param_values, Array
  serialize :header_keys, Array
  serialize :header_values, Array

  validates_inclusion_of :method, :in => %w(GET POST PUT DELETE)
  validates_format_of :url, :with => URI::regexp(%w(http https))

  def after_initialize
    data = []
    if param_keys
      param_keys.each_with_index do |key, i|
        data << "#{key}=#{param_values[i]}" if key.present?
      end
    end

    @data = data.join("&")
    @command = make_command(url, @data)
    case method
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
    if method == "PUT"
      @command.send("http_#{method.downcase}", @data)
    else
      @command.send("http_#{method.downcase}")
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
    if ["GET", "DELETE"].include?(method)
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