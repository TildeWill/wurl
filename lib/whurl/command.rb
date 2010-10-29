require 'json/pure'
require 'coderay'
require 'curb'
module Whurl
  class Command
    def initialize(url, method, options = {})
      @method = method
      data = []
      if options[:param_keys]
        options[:param_keys].each_with_index do |key, i|
          data << "#{key}=#{options[:param_values][i]}" if key.present?
        end
      end

      @data = data.join("&")
      @command = make_command(url, @data)
      case @method
        when "POST"
          @command.post_body = @data
        when "PUT"
          @command.put_data = @data
      end

      @command.useragent = "Whurl/1.0"

      if options[:header_keys]
        options[:header_keys].each_with_index do |key, i|
          @command.headers[key] = options[:header_values][i] if key.present?
        end
      end


    end

    def send_request
      acceptable_methods = ["GET", "POST", "PUT", "DELETE"]
      raise "Method not accepted" unless acceptable_methods.include?(@method)
      if @method == "PUT"
        @command.send("http_#{@method.downcase}", @data)
      else
        @command.send("http_#{@method.downcase}")
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
        else
          CodeRay.scan(JSON.pretty_generate(JSON.parse(@command.body_str)), :json).div(options)
      end
    end

    def header_html
      CodeRay.scan(@command.header_str, :txt).div(:line_numbers => nil)
    end

    def url
      @command.url
    end

    protected
    def make_command(url, data)
      if ["GET", "DELETE"].include?(@method)
        if url.include?("?")
          @command = Curl::Easy.new(url + "&" + URI.encode(data))
        else
          @command = Curl::Easy.new(url + "?" + URI.encode(data))
        end
      else
        @command = Curl::Easy.new(url)
      end
    end
  end
end