class DealMessagesController < ApplicationController
  before_action :set_deal, only: [:new, :create]
  # before_action :authenticate_user!

  def index
    @deal_messages = @deal.deal_messages.includes(:user)
  end

  def new
  end

  def create
    DealMessage.create!(
                   message: message_params[:message],
                   deal_id: message_params[:deal_id],
                   user_id: current_user.id
    )
    redirect_to @deal
  end

  private
  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def message_params
    params.permit(:message, :deal_id)
  end
end