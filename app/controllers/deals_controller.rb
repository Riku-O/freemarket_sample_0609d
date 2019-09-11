class DealsController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def done
    @deal = Deal.fetch_deal(params[:id])
  end

  def show
    @deal = Deal.fetch_deal(params[:id])
  end

  def new
    @deal = new_with
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    if Card.last
      customer = Payjp::Customer.retrieve(Card.last.customer_id)
      @card = customer.cards.first
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp_secret_key
    # card = Card.where(user_id: current_user.id).first
    card = Card.where(user_id: current_user.id).first
    @deal = new_with
    @payjp_charge = Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    ActiveRecord::Base.transaction do
      p @deal.save
      @deal.save!
      @item.update!(status: :being_sold)
    end
    # 購入完了画面に移動
    redirect_to deal_path(id: @deal.id)
  end

  private

  def new_with
    # Deal.new(item_id: set_item.id, buyer_id: current_user.id, seller_id: set_item.user_id)
    Deal.new(item_id: set_item.id, buyer_id: current_user.id, seller_id: set_item.user_id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
