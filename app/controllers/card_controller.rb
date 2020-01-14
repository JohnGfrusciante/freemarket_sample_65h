class CardController < ApplicationController
  require "payjp"
  before_action :check_login
  before_action :set_card, only: [:new, :destroy, :show]

  def new
    @item= Item.find(params[:item_id])
    if @card.presence
      get_card_params
      render("card/show")
    end
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_TEST_S_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index", controller: "purchase"
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    @item = Item.find(params[:item_id])
    if !@card.blank?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_TEST_S_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @card.blank?
      redirect_to action: "new"
    else
      get_card_params
    end
  end

  private
  
  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def get_card_params
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_TEST_S_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def check_login
    if !current_user.presence
      redirect_to '/users/sign_in' and return
    end
  end
end
