class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy]
  def index
    @items= Item.order("created_at DESC").limit(10)
    @images = ItemImage.all
  end

  def show
  # 参照する１つの商品情報を取得。選択したアイテムのIDを引数にする
    @item= Item.find(1)
  # item_idの値が同じレコードを取得
    @image= @item.item_images.where(item_id: @item.id)
    gon.image= @item.item_images.where(item_id: @item.id)
  # 出品者情報を取得（名前だけが欲しい）。seller_idとusersテーブルのidを紐付け
    @seller_name= User.find(@item.seller_id)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new, notice: '商品情報の保存に失敗しました'
    end 
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
