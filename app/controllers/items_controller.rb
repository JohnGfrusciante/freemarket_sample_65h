class ItemsController < ApplicationController
  protect_from_forgery
  require 'payjp'

  Payjp.api_key = 'sk_test_8473a73101c4bbe12a3076de'
  Payjp.open_timeout = 30 # optionally
  Payjp.read_timeout = 90 # optionally

  # ex, create charge
  charge = Payjp::Charge.create(
    amount: 9000,
    card: token,
    currency: 'jpy',
  )

  def index
    @items= Item.all
  end
end
