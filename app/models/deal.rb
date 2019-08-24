class Deal < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

  after_destroy :deal_destroy_action

  def deal_destroy_action
    puts "deal_destroy"
  end
end
