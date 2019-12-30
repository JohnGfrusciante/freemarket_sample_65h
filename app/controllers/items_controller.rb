class ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    
    @item = Item.new(item_params)
    @item.save
   end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :condition, :shipping_charge, :shipping_date, :prefecture, item_images_attributes: [:image, :_destroy])
  end
end
