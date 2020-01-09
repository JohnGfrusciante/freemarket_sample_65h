class CardController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: 8)
# card = Card.where(user_id: current_user.id)のちに変更
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_TEST_S_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
#email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: 8}
# metadata: {user_id: current_user.id}後に変更
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: 8, customer_id: customer.id, card_id: customer.default_card)
# @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)後に変更
      if @card.save
        redirect_to action: "index", controller: "purchase"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: 8)
# card = Card.where(user_id: current_user.id).first後に変更
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_TEST_S_KEY"]
# card.customer_id後に引数
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.find_by(user_id: 8)
# card = Card.where(user_id: current_user.id).first後に変更
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_TEST_S_KEY"]
# card.customer_id後に引数
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
