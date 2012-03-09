module WhurlEngine
  class StoriesController < WhurlEngine::ApplicationController
    def index
      @stories = WhurlEngine::Story.all
    end

    def new
      @story = WhurlEngine::Story.new
    end

    def create
      @story = WhurlEngine::Story.new(params[:story])
      unless @story.save
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @story}
      end
    end

    def edit
      @story = WhurlEngine::Story.find(params[:id])
    end

    def update
      @story = WhurlEngine::Story.find(params[:id])
      unless @story.update_attributes(params[:story])
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @story}
      end
    end

    def destroy
      @story = WhurlEngine::Story.find(params[:id])
      unless @story.destroy
        render :partial => 'whurl_engine/shared/error', :locals => {:object => @story}
      end
    end
  end
end
