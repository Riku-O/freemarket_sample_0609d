class Brand < ApplicationRecord
  has_many :items
  validates :name, presence: true

  # ブランドがテーブルにあれば、そのレコードを引っ張ってくる、なければ作成
  def self.save_brand(item, brand_name)
    if brand_name.present?
      brand = Brand.find_or_create_by!(name: brand_name)
      item.save(brand_id: brand.id)
    end
  end
end
