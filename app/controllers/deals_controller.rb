class DealsController < ApplicationController
  def new
    @deal = new_with
  end

  def create
  end

  private
  def new_with
    Deal.new(item_id: set_item.id, buyer_id: 1, seller_id: set_item.user_id)
  end

  def set_item
    Item.find(params[:item_id])
  end

end
