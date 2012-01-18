module WhurlEngine
  class HeaderDefinitionsController < WhurlEngine::ApplicationController
    def new
      @header_definition = WhurlEngine::HeaderDefinition.new(:resource_id => params[:resource_id])
    end

    def create
      @header_definition = WhurlEngine::HeaderDefinition.new(params[:header_definition])
      unless @header_definition.save
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @header_definition}
      end
    end

    def edit
      @header_definition = WhurlEngine::HeaderDefinition.find(params[:id])
    end

    def update
      @header_definition = WhurlEngine::HeaderDefinition.find(params[:id])
      unless @header_definition.update_attributes(params[:header_definition])
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @header_definition}
      end
    end

    def destroy
      @header_definition = WhurlEngine::HeaderDefinition.find(params[:id])
      unless @header_definition.destroy
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @header_definition}
      end
    end
  end
end