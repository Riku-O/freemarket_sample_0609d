class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.references :item, foreign_key: true
      t.integer :seller_id, null: false
      t.integer :buyer, null: false
      t.integer :status, default: 0
      t.timestamps
    end
  end
end