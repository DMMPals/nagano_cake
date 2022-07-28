class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.all
    @cart_items = CartItem.where(order_id: params[:id])
    @total = @order.payment_price - @order.postage
  end

  def update
    @order = Order.find(params[:id])
      if @order.update(order_params)
        if @order.order_status == "confirm_payment"
           @order.order_details.each do |order_detail|
             order_detail.update(item_status: 1)
            end
        end
        redirect_to admin_order_path(@order.id)
      else
          @orders = Order.all
          redirect_to admin_order_path(@order.id)
      end
  end


  def order_params
    params.require(:order).permit(:order_status)
  end
end
