class Admin::ItemsController < ApplicationController
  
  def new
  end
  
  def index
    @items = Item.all
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
end
