module WurlEngine
  class WurlsController < WurlEngine::ApplicationController
    def new
      @wurl = Wurl.new
    end

    def create
      request_params = params[:wurl]
      request_params[:request_headers] = HTTParty::Response::Headers.new(Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k, _| k.blank? })
      request_params[:request_parameters] = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k, _| k.blank? }
      @wurl = Wurl.new(request_params)

      unless @wurl.save
        flash[:alert] = @wurl.errors.map {|k,v| "#{k.to_s.titleize} #{v}"}.join('\n')
        render :new and return
      end
      redirect_to @wurl
    end

    def show
      @wurl = Wurl.find_by_hash_key(params[:id])
    end
  end
end
