class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def customers_params
    params.require(:customers).permit(:surname, :name, :surname_kana, :name_kana, :post, :address, :tel)
  end
end
