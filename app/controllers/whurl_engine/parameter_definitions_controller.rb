module WhurlEngine
  class ParameterDefinitionsController < ApplicationController
    def new
      @parameter = WhurlEngine::ParameterDefinition.new(:resource_id => params[:resource_id])
    end

    def create
      @parameter = WhurlEngine::ParameterDefinition.new(params[:parameter])
      unless @parameter.save
        render :partial => 'error'
      end
    end

    def edit
      @parameter = WhurlEngine::ParameterDefinition.find(params[:id])
    end

    def update
      @parameter = WhurlEngine::ParameterDefinition.find(params[:id])
      unless @parameter.update_attributes(params[:parameter])
        render :partial => 'error'
      end
    end

    def destroy
      @parameter = WhurlEngine::ParameterDefinition.find(params[:id])
      unless @parameter.destroy
        render :partial => 'error'
      end
    end
  end
end