class ItemsController < ApplicationController

  def index
    binding.pry
    @items = Item.fetch_items.joins(:item_images).first
  end

end
