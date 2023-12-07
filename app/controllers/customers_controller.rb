class CustomersController < ApplicationController
    before_action :set_customer, only: %i[show update destroy]
  
    def index
      @customers = Customer.includes(:adress).all
      render_customers
    end
  
    def show
      render_customer
    end
  
    def create
      @customer = Customer.new(customer_params)
  
      if @customer.save
        render_customer(status: :created)
      else
        render_errors(@customer)
      end
    end
  
    def update
      if @customer.update(customer_params)
        render_customer
      else
        render_errors(@customer)
      end
    end
  
    def destroy
      @customer.destroy
    end
  
    private
  
    def set_customer
      @customer = Customer.find(params[:id])
    end
  
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, adress_attributes: %i[id street_name number neighborhood _destroy],
                                                                contact_attributes: %i[id phone_number _destroy])
    end
  
    def render_customer(options = {})
        render json: @customer, include: { 
            adress: { only: %i[street_name number neighborhood] }, 
            contact: { only: %i[ phone_number ] }
        }, except: %i[created_at updated_at], **options
    end
  
    def render_customers
        render json: @customers, include: { 
            adress: { only: %i[street_name number neighborhood] },
            contact: { only: %i[ phone_number ] }                            
        }, except: %i[created_at updated_at]
    end
  
    def render_errors(resource)
      render json: resource.errors, status: :unprocessable_entity
    end
  end
  