require 'json/pure'
require 'coderay'
require 'curb'
module Whurl
  class Command
    def initialize(url, method, options = {})
      data = []
      if options[:param_keys]
        options[:param_keys].each_with_index do |key, i|
          data << "#{key}=#{options[:param_values][i]}" if key.present?
        end
      end

      @command = Curl::Easy.new(url + "?" + data.join("&"))
      @command.useragent = "Whurl/1.0"

      if options[:header_keys]
        options[:header_keys].each_with_index do |key, i|
          @command.headers[key] = options[:header_values][i] if key.present?
        end
      end

      @command.send("http_#{method.downcase}")

    end

    def body_str
      @command.body_str
    end

    def response_html
      if @command.content_type =~ /xml/
        CodeRay.scan(@command.body_str, :xml).div(:line_numbers => :table)
      else
        CodeRay.scan(JSON.pretty_generate(JSON.parse(@command.body_str)), :json).div(:line_numbers => :table)
      end      
    end

    def url
      @command.url
    end
  end
end