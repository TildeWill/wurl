module WhurlEngine
  class RequestsController < ApplicationController
    def new
      @whurl = Request.new
    end

    def create
      whurl = params[:request]
      whurl[:headers] = Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k, _| k.blank? }
      whurl[:query] = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k, _| k.blank? }
      @whurl = Request.new(whurl)

      if @whurl.save
        redirect_to short_path(:slug => @whurl.slug) and return
      else
        render :action => "new"
      end
    end

    def edit
      @whurl = Request.where("custom_url = ? OR hash_key = ?", params[:slug], params[:slug]).first
      @response_body = @whurl.response.to_html(:line_numbers => :table).html_safe.force_encoding(Encoding.default_external).html_safe
      @response_headers = @whurl.response.headers.to_html.html_safe
    rescue Exception => e
      @response_body = ("<pre>" + e.message + "\n\n" + e.backtrace.join("\n") + "</pre>").html_safe
    end
  end
end
