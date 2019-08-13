class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  has_many :deals, dependent: :destroy
  # has_one :review, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :category
  # TODO: ブランドの実装はまた後日
  # belongs_to :brand, inverse_of: :brand
  validates :name, presence: true
  validates :condition, presence: true
  validates :postage_burden, presence: true
  # validates :shipping_method, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status, presence: true
  # TODO:ブランドの実装は後日のためなしで
  # accepts_nested_attributes_for :brand


  enum status: {no_traded: 0, traded: 1}

  def self.fetch_items
    items = Item.new
    items = []
    items << sort_lady
    items << sort_men
  end

  def is_hosted_by?(current_user_id)
    if self.user_id == current_user_id
      true
    else
      false
    end
  end

  def self.fetch_item(item_id)
    Item.find(item_id)
  end

  private
  # リファクタリング必要
  def self.sort_lady
    Item.includes(:category, :item_images).where(category_id: 11..25).last(4)
  end

  def self.sort_men
    Item.includes(:category, :item_images).where(category_id: 26..34).last(4)
  end

end
