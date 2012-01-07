module WhurlEngine
  class CategoriesController < ApplicationController
    def index
      @categories = WhurlEngine::Category.all.sort
    end

    def new
      @category = WhurlEngine::Category.new
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

    def edit
      @category = WhurlEngine::Category.find(params[:id])
    end

    def update
      @category = WhurlEngine::Category.find(params[:id])
      respond_to do |format|
        if @category.update_attributes(params[:category])
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