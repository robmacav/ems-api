class DevicesController < ApplicationController
    before_action :set_device, only: %i[show update destroy]
  
    def index
      @categories = Device.all
      render json: @categories
    end
  
    def show
      render json: @device
    end
  
    def create
      @device = Device.new(device_params)
  
      if @device.save
        render json: @device
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @device.update(device_params)
        render json: @device
      else
        render json: @device.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @device.destroy
    end
  
    private
  
    def set_device
      @device = Device.find(params[:id])
    end
  
    def device_params
      params.require(:device).permit(:description, :device_category_id, :customer_id)
    end
end
  