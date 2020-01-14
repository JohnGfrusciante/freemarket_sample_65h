class PurchaseController < ApplicationController
  require 'payjp'
  before_action :check_login, only: [:index, :pay]
  before_action :set_card, only: [:index, :pay]
  before_action :set_item, only: [:index, :pay]
  before_action :check_transaction, only: [:index, :pay]

  def index
    @image = @item.item_images.where(item_id: @item.id)
    if !@card.blank?
      Payjp.api_key = ENV["PAYJP_TEST_S_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    @item.update(buyer_id: current_user.id, transaction_status: 1)
  end

  def pay
    if @card.presence
      Payjp.api_key = ENV['PAYJP_TEST_S_KEY']
      Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
      )
      @item.update(transaction_status: 2)
      render :done
    else
      redirect_to item_purchase_index_path(@item)
    end
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_login
    if !current_user.presence
      redirect_to '/users/sign_in' and return
    end
  end

  def check_transaction
    if @item.seller_id == current_user.id
      redirect_to item_path(@item.id) and return
    end

    if @item.transaction_status == 2
      redirect_to item_path(@item.id) and return
    end
  end
end