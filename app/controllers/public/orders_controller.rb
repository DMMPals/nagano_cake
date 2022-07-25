class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.post = current_customer.post
      @order.address = current_customer.address
      @order.name = current_customer.surname + current_customer.name
    elsif params[:order][:address_option] == "1"
      address = OrderAddress.find(params[:order][:order_address_id])
      @order.post = address.post
      @order.address = address.address
      @order.name = address.order_name
    elsif params[:order][:address_option] == "2"
      @order.post = params[:order][:post]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  end

  def done
  end

  def create
    order = Order.new(order_params)
    order.save

  end

  def index
  end

  def show
  end



  private

   def order_params
    params.require(:order).permit()
   end
end