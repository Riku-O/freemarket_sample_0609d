class Category < ApplicationRecord
  has_many :items
  has_ancestry

  def self.fetch_sub_categories(category_id)
    category = Category.find(category_id)
    return category.children
  end

  def self.selected_category_ids(category_id)
    category = Category.find(category_id)
    descendants = category.descendants
    category_ids = []
    descendants.each do |descendant|
      category_ids << descendant.id
    end
    category_ids
  end
end
