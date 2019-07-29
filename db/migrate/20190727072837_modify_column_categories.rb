class ModifyColumnCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :path, :ancestry
  end
end
