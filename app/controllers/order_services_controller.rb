class OrderServicesController < ApplicationController
    before_action :set_order, only: %i[show update destroy]
  
    def index
      @orders = OrderService.all
      render json: @orders
    end
  
    def show
      render json: @order
    end
  
    def create
      @order = OrderService.new(order_params)
  
      if @order.save
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @order.destroy
    end
  
    private
  
    def set_order
      @order = OrderService.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:description, :details, :start_date, :end_date, :device_id)
    end
end
  