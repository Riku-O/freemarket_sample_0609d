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
    #is_hosted_by?メソッドを使って、出品者以外が閲覧した際に編集ボタンが表示されないようにする。
  end

  def destroy
  end

  def edit
    @item
  end

  def update
    @item.update(item_params)
  end

  private
  def set_item
    @item = Item.fetch_item(item_params[:id])
  end
  # パラメーター受け取りのためのキーは画面実装が進んでから調整
  def item_params
    params
  end
end
