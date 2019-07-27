class AddAncestryToCategories < ActiveRecord::Migration[5.2]
  def up
    remove_column :categories, :path, :string
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
  end

  def down
    add_column :categories, :path, :string
    remove_column :categories, :ancestry, :string
    remove_index :categories, :ancestry
  end
end
