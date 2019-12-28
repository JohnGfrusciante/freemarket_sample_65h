class ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def show
  # 参照する１つの商品情報を取得。選択したアイテムのIDを引数にする
    @item= Item.find(1)
  # item_idの値が同じレコードを取得
    @image= ItemImage.where(item_id: @item.id)
    gon.image= ItemImage.where(item_id: @item.id)

  # 出品者情報を取得（名前だけが欲しい）。seller_idとusersテーブルのidを紐付け
    @seller_name= User.find(@item.seller_id)
  end

  private
  def item_params
    # params.permit(:id)
  end
end