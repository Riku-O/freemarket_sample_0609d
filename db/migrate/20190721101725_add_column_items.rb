class AddColumnItems < ActiveRecord::Migration[5.2]
  def up
    add_reference :items, :user, foreign_key: true, null: false
    add_reference :items, :category, foreign_key: true, null: false
  end

  def down
    remove_reference :items, :user, foreign_key: true, null: false
    remove_reference :items, :category, foreign_key: true, null: false
  end
end
