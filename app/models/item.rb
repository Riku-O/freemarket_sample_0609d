class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_one :review, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :category
  # belongs_to :brand

  def self.fetch_items
    @items = Item.new
    items = []
    items << sort_lady
    items << sort_men
  end

  private
  def self.sort_lady
    Item.includes(:category, :item_images).where(category_id: 11..25).last(4)
  end

  def self.sort_men
    Item.includes(:category, :item_images).where(category_id: 26..34).last(4)
  end

end
