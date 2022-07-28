class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if@order_detail.item_status == "making"
           @order_detail.order.update(order_status: 2)
           redirect_to admin_order_path(@order_detail.order.id)
      elsif @order_detail.item_status == "complete"
            @order_detail.order.update(order_status: 3)
        redirect_to admin_order_path(@order_detail.order.id)
      else
      @orders = Order.all
      redirect_to admin_order_path(@order_detail.order.id)
      end
    end
  end


    private

    def order_detail_params
      params.require(:order_detail).permit(:item_status)
    end
end

