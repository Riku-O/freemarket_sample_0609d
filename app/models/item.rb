class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  has_one :deal, dependent: :destroy
  # has_one :review, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :user
  belongs_to :category
  # TODO: ブランドの実装はまた後日
  # belongs_to :brand, inverse_of: :brand
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :source_area
  belongs_to :condition
  belongs_to :shipping_date
  belongs_to :post_burden

  validates :name, presence: true
  validates :condition_id, presence: true
  validates :post_burden_id, presence: true
  # validates :shipping_method_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status, presence: true
  # TODO:ブランドの実装は後日のためなしで


  enum status: {being_sold: 0, sold: 1, stopped_selling: 2}

  def self.fetch_items
    Item.includes(:item_images).last(4)
    # items = []
    # items << sort_lady
    # items << sort_men
  end

  def is_hosted_by?(current_user_id)
    if self.user_id == current_user_id
      true
    else
      false
    end
  end

  def self.fetch_item(item_id)
    Item.includes(:item_images, :category).find(item_id)
  end

  private
  # TODO:ブランド機能実装したら一覧も編集
  # def self.sort_lady
  #   Item.includes(:category, :item_images).where(category_id: 11..25).references(:categories).last(4)
  # end
  #
  # def self.sort_men
  #   Item.includes(:category, :item_images).where(category_id: 26..34).references(:categories).last(4)
  # end

end
