class Admin::ItemsController < ApplicationController

  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
          redirect_to admin_items_path(@item.id)
    else
          render "admin/items/new"
    end
      
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
end
