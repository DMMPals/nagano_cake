class Admin::ItemsController < ApplicationController

  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
          redirect_to admin_items_path(@item.id)
    else
          render :new
    end
      
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item = Item.find(params[:id])
       @item.update(item_params)
       redirect_to admin_items_path
    else
       render :edit
    end
  end
  
  




private
 def item_params
  params.require(:item).permit(:name, :price, :explain, :image, :is_active, :genre_id)
 end 
end
