module WhurlEngine
  class ResourcesController < WhurlEngine::ApplicationController
    def show
      @resource = WhurlEngine::Resource.find(params[:id])
    end

    def new
      @resource = WhurlEngine::Resource.new(:category_id => params[:category_id])
    end

    def create
      @resource = WhurlEngine::Resource.new(params[:resource])
      unless @resource.save
        render :partial => 'error'
      end
    end

    def edit
      @resource = WhurlEngine::Resource.find(params[:id])
    end

    def update
      @resource = WhurlEngine::Resource.find(params[:id])
      unless @resource.update_attributes(params[:resource])
        render :partial => 'error'
      end
    end

    def destroy
      @resource = WhurlEngine::Resource.find(params[:id])
      unless @resource.destroy
        render :partial => 'error'
      end
    end
  end
end