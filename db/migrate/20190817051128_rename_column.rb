class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :shipping_date, :shipping_date_id
    rename_column :items,:source_area, :source_area_id
    rename_column :items, :condition, :condition_id
  end
end
