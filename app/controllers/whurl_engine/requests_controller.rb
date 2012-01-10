module WhurlEngine
  class RequestsController < ApplicationController
    def new
      @request = Request.new
    end

    def create
      request_params = params[:request]
      request_params[:headers] = Hash[params[:header_keys].zip(params[:header_values])].delete_if { |k, _| k.blank? }
      request_params[:query] = Hash[params[:param_keys].zip(params[:param_values])].delete_if { |k, _| k.blank? }
      @request = Request.new(request_params)

      unless @request.save
        flash[:alert] = @request.errors.map {|k,v| "#{k.to_s.titleize} #{v}"}.join('\n')
        render :new and return
      end
      redirect_to short_path(:slug => @request.slug)
    end

    def show
      @request = Request.find_by_hash_key(params[:slug])
    end
  end
end
