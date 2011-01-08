class CommandsController < ApplicationController
  def new
    @command = Whurl::Command.new
  end

  def edit
    command_fields = %w(url http_method header_keys header_values param_keys param_values)
    command_params = params.reject{|k,_| !command_fields.include?(k)}
#    puts p
    @command = Whurl::Command.new(command_params)
#    puts @command
    @command.send_request
    @response_headers = @command.header_html

    respond_to do |format|
      format.html do
        if(params['response_only'] == 'true')
          @api_response = @command.response_html({:line_numbers => nil})
          render('show', :layout => false) and return
        else
          @api_response = @command.response_html({:line_numbers => :table})
        end
      end
      format.iphone do
        @api_response = @command.response_html({:line_numbers => nil})
      end
    end

  rescue Exception => e
    @api_response = e.message
  end

end

