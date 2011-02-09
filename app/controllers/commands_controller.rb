require 'coderay'
class CommandsController < ApplicationController
  def new
  end

  def edit
    client_headers = Hash[params[:header_keys].zip(params[:header_values])]
    client_params = Hash[params[:param_keys].zip(params[:param_values])]

    response = AnyClient.send(params[:http_method].downcase, params[:url], :headers => client_headers, :query => client_params, :body => params[:body])
    headers = []
    response.headers.each_capitalized do |name, value|
      headers << "#{name}: #{value}"
    end
    @response_headers = CodeRay.scan(headers.join("\n"), :txt).div(:line_numbers => nil)

    respond_to do |format|
      format.html do
        @api_response = AnyClient.response_html(response, :line_numbers => :table)
      end
      format.iphone do
        @api_response = AnyClient.response_html(response, :line_numbers => nil)
      end
    end

  rescue Exception => e
    @api_response = e.message + "\n\n" + e.backtrace.join("\n")
  end

end

