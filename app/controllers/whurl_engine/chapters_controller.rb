module WhurlEngine
  class ChaptersController < WhurlEngine::ApplicationController
    def new
      @chapter = WhurlEngine::Chapter.new(:story_id => params[:story_id])
    end

    def create
      @chapter = WhurlEngine::Chapter.new(params[:chapter])
      unless @chapter.save
        render :partial => 'error'
      end
    end

    def edit
      @chapter = WhurlEngine::Chapter.find(params[:id])
    end

    def update
      @chapter = WhurlEngine::Chapter.find(params[:id])
      unless @chapter.update_attributes(params[:chapter])
        render :partial => 'error'
      end
    end

    def destroy
      @chapter = WhurlEngine::Chapter.find(params[:id])
      unless @chapter.destroy
        render :partial => 'error'
      end
    end
  end
end