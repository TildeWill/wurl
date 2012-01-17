module WhurlEngine
  class ParameterDefinitionsController < WhurlEngine::ApplicationController
    def new
      @parameter_definition = WhurlEngine::ParameterDefinition.new(:resource_id => params[:resource_id])
    end

    def create
      @parameter_definition = WhurlEngine::ParameterDefinition.new(params[:parameter_definition])
      unless @parameter_definition.save
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @parameter_definition}
      end
    end

    def edit
      @parameter_definition = WhurlEngine::ParameterDefinition.find(params[:id])
    end

    def update
      @parameter_definition = WhurlEngine::ParameterDefinition.find(params[:id])
      unless @parameter_definition.update_attributes(params[:parameter_definition])
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @parameter_definition}
      end
    end

    def destroy
      @parameter_definition = WhurlEngine::ParameterDefinition.find(params[:id])
      unless @parameter_definition.destroy
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @parameter_definition}
      end
    end
  end
end