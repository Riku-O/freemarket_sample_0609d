class Brand < ApplicationRecord
  # TODO:ブランドの保存は後日実装
  # has_many :items, inverse_of: :items
  validates :name, presence: true

  # ブランドがテーブルにあれば、そのレコードを引っ張ってくる、なければ作成
  def self.save_brand(item, brand_name)
    if brand_name.present?
      brand = Brand.find_or_create_by!(name: brand_name)
      item.update!(brand_id: brand.id)
    end
  end
end
