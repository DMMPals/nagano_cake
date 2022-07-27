class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
      @subtotal = (Item.find(cart_item.item_id).price * 1.08 * cart_item.quantity).to_i
      @sum += @subtotal
    end
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
    @order.postage = 800
    @order.payment_price = @sum + @order.postage
  end

  def done
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.quantity = cart_item.quantity
      order_detail.sale_price = cart_item.item.add_tax_price
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to public_done_path

  end

  def index
    
  end

  def show
  end



  private

   def order_params
    params.require(:order).permit(:post, :address, :name, :payment, :postage, :payment_price)
   end
end