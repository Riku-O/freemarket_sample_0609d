class CardController < ApplicationController

  require "payjp"

  def new
    # card = Card.where(user_id: current_user.id)
    card = Card.where(user_id: 1)

    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp_secret_key

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        # email: current_user.email,
        card: params['payjp-token']
      )

      # @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @card = Card.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    # card = Card.where(user_id: current_user.id).first
    card = Card.where(user_id: 1).first

    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp_secret_key
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    # card = Card.where(user_id: current_user.id).first
    card = Card.where(user_id: 1).first

    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp_secret_key
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
