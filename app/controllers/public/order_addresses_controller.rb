class Public::OrderAddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.order_address.all
    @address = OrderAddress.new
  end

  def edit
    @address = OrderAddress.find(params[:id])
    unless @address.customer_id == current_customer.id
      @addresses = current_customer.order_address.all
      render :index
    end
  end

  def create
    @address = OrderAddress.new(order_address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash.now[:notice] = '配送先の登録が完了しました。'
      @addresses = current_customer.order_address.all
      render :index
    else
      @addresses = current_customer.order_address.all
      render :index
    end
  end

  def update
    @address = OrderAddress.find(params[:id])
    if @address.update(order_address_params)
      @addresses = current_customer.order_address.all
      flash.now[:notice] = '配送先の更新が完了しました。'
      render :index
    else
      render :edit
    end
  end

  def destroy
    @address = OrderAddress.find(params[:id])
    @address.destroy
    @addresses = current_customer.order_address.all
    flash.now[:notice] = '配送先の削除が完了しました。'
    render :index
  end

  private

  def order_address_params
    params.require(:order_address).permit(:order_name, :post, :address)
  end

end
