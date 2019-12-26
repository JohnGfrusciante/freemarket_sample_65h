class ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def show
    @item= Item.find(1)
    # binding.pry
  end
end
