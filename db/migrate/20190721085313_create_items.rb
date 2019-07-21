class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :size
      t.string :condition, null: false
      t.integer :postage_burden, null: false
      t.string :shipping_method, null: false
      t.string :source_area, null: false
      t.string :shipping_date, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
