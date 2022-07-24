class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  
  private
 def item_params
  params.require(:item).permit(:name, :price, :explain, :image, :is_active, :genre_id)
 end 
  
end


