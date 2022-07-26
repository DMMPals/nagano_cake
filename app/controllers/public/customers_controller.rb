class Public::CustomersController < ApplicationController

  def show
    @user = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    if @user.update(customers_params)
      render :show, notice: '会員情報の変更が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_customer
    @user.update(is_enable: false)
    redirect_to public_root_path
  end

  private

  def customers_params
    params.require(:customer).permit(:surname, :name, :surname_kana, :name_kana, :post, :address, :tel)
  end
end
