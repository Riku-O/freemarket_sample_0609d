class Brand < ApplicationRecord
  has_many :items

  def self.save_brand(item, brand_name)
    if brand_name.present?
      brand = Brand.find_or_create_by!(name: brand_name)
      item.save(brand_id: brand.id)
    end
  end
end
