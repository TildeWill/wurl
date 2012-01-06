module WhurlEngine
  class CategoriesController < ApplicationController
    def index
      @categories = WhurlEngine::Category.all.sort
    end
    def create
      @category = WhurlEngine::Category.new(params[:category])
      respond_to do |format|
        if @category.save
          format.js
        else
          format.js { render :partial => 'error' }
        end
      end
    end

    def destroy
      @category = WhurlEngine::Category.find(params[:id])
      respond_to do |format|
      if @category.destroy
        format.js
      else
        format.js { render :partial => 'error' }
      end
    end
    end
  end
end