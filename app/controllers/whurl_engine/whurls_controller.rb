module WhurlEngine
  class WhurlsController < WhurlEngine::ApplicationController
    def new
      @whurl = Whurl.new
    end

    def create
      request_params = params[:whurl]
      request_params[:request_headers] = HTTParty::Response::Headers.new(Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k, _| k.blank? })
      request_params[:request_parameters] = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k, _| k.blank? }
      @whurl = Whurl.new(request_params)

      unless @whurl.save
        flash[:alert] = @whurl.errors.map {|k,v| "#{k.to_s.titleize} #{v}"}.join('\n')
        render :new and return
      end
      redirect_to @whurl
    end

    def show
      @whurl = Whurl.find_by_hash_key(params[:id])
    end
  end
end
