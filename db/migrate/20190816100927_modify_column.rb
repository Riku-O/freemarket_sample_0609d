class ModifyColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :source_area, :integer
    change_column :items, :postage_burden, :integer
    change_column :items, :shipping_date, :integer
    change_column :items, :shipping_method, :integer, null: true
    change_column :items, :size, :string, null: true
  end
end
