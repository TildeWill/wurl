require "whurl_engine/version"

module WhurlEngine
  class WhurlRequestsController < ApplicationController
    def new
      @whurl = WhurlRequest.new
    end

    def create
      whurl = params[:whurl_request]
      whurl[:headers] = Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k, _| k.blank? }
      whurl[:query] = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k, _| k.blank? }
      @whurl = WhurlRequest.new(whurl)

      if @whurl.save
        redirect_to short_path(:slug => @whurl.slug) and return
      else
        render :action => "new"
      end
    end

    def edit
      @whurl = WhurlRequest.find_by_hash_key(params[:slug])
      if @whurl.nil?
        @whurl = WhurlRequest.find_by_custom_url(params[:slug])
      end

      client_headers = {'User-Agent' => "Whurl/#{WhurlEngine::VERSION} (https://github.com/tildewill/whurl_engine)"}.merge(@whurl.headers)

      client_response = AnyClient.send(@whurl.http_method.downcase,
                                       @whurl.url,
                                       :headers => client_headers,
                                       :query => @whurl.query,
                                       :body => @whurl.body
      )

      @response_headers = client_response.headers.to_html.html_safe

      respond_to do |format|
        format.html do
          @api_response = client_response.to_html(:line_numbers => :table).html_safe
        end
        #format.iphone do
        #  @api_response = client_response.to_html(:line_numbers => nil).html_safe
        #end
      end

    rescue Exception => e
      @api_response = ("<pre>" + e.message + "\n\n" + e.backtrace.join("\n") + "</pre>").html_safe
    end
  end
end
