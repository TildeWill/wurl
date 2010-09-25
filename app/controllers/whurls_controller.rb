require 'json/pure'
require 'coderay'
require 'curb'

class WhurlsController < ApplicationController
  def index
    @urls = []
    @param_keys = []
    @param_values = []
    @header_keys = []
    @header_values = []
  end

  def create
    @urls = []
    @method = params['method']
    @api_url = params["url"]
    @param_keys = params['param_keys']
    @param_values = params['param_values']
    @header_keys = params['header_keys']
    @header_values = params['header_values']



    data = []
    if @param_keys
      @param_keys.each_with_index do |key, i|
        data << "#{key}=#{@param_values[i]}" if key.present?
      end
    end

    command = Curl::Easy.new(@api_url + "?" + data.join("&"))
    @command = command.url
    command.useragent = "Whurl/1.0"

#    if @method == "GET"
#      command += " -G"
#    end

    if @header_keys
      @header_keys.each_with_index do |key, i|
        command.headers[key] = @header_values[i] if key.present?
      end
    end


    command.perform


    begin
      if command.content_type =~ /xml/
        @api_response = CodeRay.scan(command.body_str, :xml).div(:line_numbers => :table, :wrap => :page)
      else
        @api_response = CodeRay.scan(JSON.pretty_generate(JSON.parse(command.body_str)), :json).div(:line_numbers => :table, :wrap => :page)
      end
    rescue
      @api_response = curl.body
    end

  end

end
