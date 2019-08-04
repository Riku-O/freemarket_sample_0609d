class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.fetch_items
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params
  end
end
