class Deal < ApplicationRecord
  has_many :deal_messages, dependent: :destroy
  belongs_to :item
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

  enum status: {unfinished: 0, finished: 1}

  def self.fetch_deal(deal_id)
    Deal.find(deal_id)
  end
end
