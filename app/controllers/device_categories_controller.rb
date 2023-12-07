class DeviceCategoriesController < ApplicationController
    before_action :set_category, only: %i[show update destroy]
  
    def index
      @categories = DeviceCategory.all
      render json: @categories
    end
  
    def show
      render json: @category
    end
  
    def create
      @category = DeviceCategory.new(category_params)
  
      if @category.save
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @category.destroy
    end
  
    private
  
    def set_category
      @category = DeviceCategory.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:description)
    end
  end
  