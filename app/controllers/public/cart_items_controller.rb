class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
      @subtotal = (Item.find(cart_item.item_id).price * 1.08 * cart_item.quantity).to_i
      @sum += @subtotal
    end 
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = params[:cart_item][:item_id]
    @cart_item.update(cart_item_params)
  
    render "index"
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    if current_customer.cart_items.exists?(item_id: params[:cart_item][:item_id].to_i)
     @cart_item_add = CartItem.find_by(item_id: params[:cart_item][:item_id].to_i)
     @cart_item_add.quantity += params[:cart_item][:quantity].to_i 
    if @cart_item_add.save
      redirect_to public_cart_items_path
    else 
      render "index"
    end 
    else
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id=current_customer.id
     @cart_item.save
    redirect_to public_cart_items_path
    end
  end 

private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
  end
end 

