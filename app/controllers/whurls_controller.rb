require 'coderay'

class WhurlsController < ApplicationController
  def index
    @urls = []
  end

  def create
    @urls = []
    @method = params['method']
    @url = params["url"]
    @param_keys = params['param_keys']
    @param_values = params['param_values']
    @header_keys = params['header_keys']
    @header_values = params['header_values']

    command = "curl -A \"Whurl/1.0\""
    if @method == "GET"
      command += " -G"
    end

    if @param_keys
      @param_keys.each_with_index do |key, i|
        command += " --data #{key}=#{@param_values[i]}" if key.present?
      end
    end

    if @header_keys
      @header_keys.each_with_index do |key, i|
        command += " --header #{key}=#{@header_values[i]}" if key.present?
      end
    end

    command += " --url #{@url}"
    @command = CodeRay.scan(command, :terminal).div(:line_numbers => :table)

    curl = `#{command}`

#" api.twitter.com/1/statuses/public_timeline.json`
    @response = CodeRay.scan(JSON.pretty_generate(JSON.parse(curl)), :json).div(:line_numbers => :table, :wrap => :page)

  end
end
