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
  end

  def update
  end
  
end



private
 def item_params
  params.require(:item).permit(:name, :price, :explain, :image_id ,:genre_id,)
 end 
