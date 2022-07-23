class Public::OrderAddressesController < ApplicationController

  def index
    @addresses = current_customer.order_address.all
  end

  def edit
    @address = OrderAddress.find(params[:id])
  end

  def create
    @address = OrderAddress.new(order_address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer, notice: "配送先の登録が完了しました。"
    else
      @addresses = current_customer.order_address.all
      render :index
    end
  end

  def update
    @address = OrderAddress.find(params[:id])
    if @address.update(order_address_params)
      @addresses = current_customer.order_address.all
      render :index, notice: "配送先の更新が完了しました。"
    else
      render :edit
    end
  end

  def destroy
    @address = OrderAddress.find(params[:id])
    @address.destroy
    @addresses = current_customer.order_address.all
    render :index, notice: "配送先の削除が完了しました。"
  end

  private

  def order_address_params
    params.require(:order_address).permit(:order_name, :post, :address)
  end

end
