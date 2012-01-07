module WhurlEngine
  class ParametersController < ApplicationController
    def new
      @parameter = WhurlEngine::Parameter.new(:resource_id => params[:resource_id])
    end

    def create
      @parameter = WhurlEngine::Parameter.new(params[:parameter])
      unless @parameter.save
        render :partial => 'error'
      end
    end

    def edit
      @parameter = WhurlEngine::Parameter.find(params[:id])
    end

    def update
      @parameter = WhurlEngine::Parameter.find(params[:id])
      unless @parameter.update_attributes(params[:parameter])
        render :partial => 'error'
      end
    end

    def destroy
      @parameter = WhurlEngine::Parameter.find(params[:id])
      unless @parameter.destroy
        render :partial => 'error'
      end
    end
  end
end