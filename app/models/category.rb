class Category < ApplicationRecord
  has_many :items
  has_ancestry

  def self.fetch_sub_categories(category_id)
    category = Category.find(category_id)
    return category.children
  end
end
