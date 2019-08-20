class AddReferenceToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :brand, foreign_key: true
  end
end
