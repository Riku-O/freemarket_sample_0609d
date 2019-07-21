class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :path, null: false
      t.string :item, null: false
      t.timestamps
    end
  end
end
