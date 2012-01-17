module WhurlEngine
  class CategoriesController < WhurlEngine::ApplicationController
    def index
      @categories = WhurlEngine::Category.all.sort
    end

    def new
      @category = WhurlEngine::Category.new
    end

    def create
      @category = WhurlEngine::Category.new(params[:category])
      unless @category.save
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @category}
      end
    end

    def edit
      @category = WhurlEngine::Category.find(params[:id])
    end

    def update
      @category = WhurlEngine::Category.find(params[:id])
      unless @category.update_attributes(params[:category])
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @category}
      end
    end

    def destroy
      @category = WhurlEngine::Category.find(params[:id])
      unless @category.destroy
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @category}
      end
    end
  end
end