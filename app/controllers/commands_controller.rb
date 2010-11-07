class CommandsController < ApplicationController
  def new
    @command = Command.new
  end

  def edit
    @command = Command.new(params['command'])
    @command.send_request
    @response_headers = @command.header_html
    respond_to do |format|
      format.html do
        @api_response = @command.response_html({:line_numbers => :table})
      end
      format.iphone do
        @api_response = @command.response_html({:line_numbers => nil})
      end
    end

  rescue Exception => e
    @api_response = e.message
  end

end

