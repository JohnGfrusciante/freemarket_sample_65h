class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:index, :pay]
  before_action :set_item, only: [:index, :pay]


  def index
    @image = @item.item_images.where(item_id: @item.id)
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_TEST_S_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    if @card.presence
      Payjp.api_key = ENV['PAYJP_TEST_S_KEY']
      Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
      )
      render :done
    else

    end
  end

  private

  def set_card
    @card = Card.find_by(user_id: 8)
  end

  def set_item
    @item = Item.find(1)
  end
end
