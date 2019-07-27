class Item < ApplicationRecord

  has_many :item_images, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_one :review, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :category
  # belongs_to :brand

  def self.fetch_items
    @items = Item.new
    Item.limit(4)
  end
end
