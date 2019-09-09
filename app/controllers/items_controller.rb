class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # ログイン機能実装用のコードだが、出品ページ実装の際は便宜上コメントアウト

  def index
    # TODO:フロントの実装が完了したあとにSQL発行回数チェックしてリファクタリングが必須。
    @items = Item.fetch_items
  end

  def show
    #TODO:is_hosted_by?メソッドを使って、出品者以外が閲覧した際に編集ボタンが表示されないようにする。
    @item = Item.fetch_item(params[:id])
  end

  def destroy
    @item.destroy
  end

  def edit
    @item.item_images.build
  end

  def update
    if @item.update(item_params)
      redirect_to action: 'show'
      flash[:success] = "変更しました。"
    else
      render edit
      flash[:danger] = "更新に失敗しました。"
    end
  end

  private
  def set_item
    @item = Item.fetch_item(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_images)
  end
end
