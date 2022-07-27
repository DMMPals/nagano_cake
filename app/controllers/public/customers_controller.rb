class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @user = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    if @user.update(customers_params)
      flash.now[:notice] = '会員情報の変更が完了しました。'
      render :show
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_customer
  end

  def withdraw
    @user = current_customer
    @user.update(is_enable: false)
    redirect_to public_root_path, notice: 'お客様の退会が完了いたしました。'
  end

  private

  def customers_params
    params.require(:customer).permit(:surname, :name, :surname_kana, :name_kana, :post, :address, :tel)
  end
end
