class WhurlsController < ApplicationController
  def new
    @whurl = Whurl.new
    @whurl.data = {:headers => {}, :query => {}}
  end

  def create
    client_headers = Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k,_| k.blank? }
    client_params = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k,_| k.blank? }
    whurl = Whurl.new(:data => {:headers => client_headers,
                                 :query => client_params,
                                 :body => params[:body],
                                 :http_method => params[:http_method],
                                 :url => params[:url]
    })
    whurl.save
    redirect_to short_path(:id => whurl.hash_key)
  end

  def edit
    @whurl = Whurl.find_by_hash_key(params[:id])
    client_headers = {'User-Agent' => "Whurl/1.1 (https://whurl.heroku.com)"}.merge(@whurl.data[:headers])

    client_response = AnyClient.send(@whurl.data[:http_method].downcase,
                                     @whurl.data[:url],
                                     :headers => client_headers,
                                     :query => @whurl.data[:query],
                                     :body => @whurl.data[:body]
    )

    @response_headers = client_response.headers.to_html

    respond_to do |format|
      format.html do
        @api_response = client_response.to_html(:line_numbers => :table)
      end
      format.iphone do
        @api_response = client_response.to_html(:line_numbers => nil)
      end
    end

  rescue Exception => e
    @api_response = "<pre>" + e.message + "\n\n" + e.backtrace.join("\n") + "</pre>"
  end
end

