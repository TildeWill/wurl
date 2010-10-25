class Whurl::CommandsController < ApplicationController
  def new
    @api_url = nil
    @method = nil
  end

  def edit
    @api_url = params.delete("url")
    @method = params.delete("method")
    params['header_keys'] = params['header_keys'].select {|k| k.present?} if params['header_keys'].present?
    params['header_values'] = params['header_values'].select {|v| v.present?} if params['header_values'].present?
    params['param_keys'] = params['param_keys'].select {|k| k.present?} if params['param_keys'].present?
    params['param_values'] = params['param_values'].select {|v| v.present?} if params['param_values'].present?
    redirect_to new_whurl_commands_path and return unless @api_url.present?
    begin
      command = Whurl::Command.new(@api_url, @method, params)
      command.send_request
      @api_response = command.response_html
      @response_headers = command.header_html
    rescue Exception => e
      @api_response = e.message
    end

  end

end
