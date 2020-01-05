class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy]
  def index
    @items= Item.all
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
  end

  def edit
    if @item.present?
      render :edit
    else
      redirect_to root_path, notice: '商品の情報がありません'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品情報を更新しました'
    else
      render :edit, notice: '商品の更新に失敗しました'
    end
  end

  def destroy
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :price, :condition, :shipping_charge, :shipping_date, :prefecture, item_images_attributes: [:id, :image, :_destroy])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
