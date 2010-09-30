class Whurl::CommandsController < ApplicationController
  def new
    @api_url = nil
    @method = nil
  end

  def edit
    @api_url = params.delete("url")
    @method = params.delete("method")
    redirect_to new_whurl_commands_path and return unless @api_url.present?

    command = Whurl::Command.new(@api_url, @method, params)

    begin
      @api_response = command.response_html
    rescue
      @api_response = command.body_str
    end

  end

end
