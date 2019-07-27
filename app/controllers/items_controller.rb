class ItemsController < ApplicationController

  def index
    @items = Item.fetch_items
  end

end
