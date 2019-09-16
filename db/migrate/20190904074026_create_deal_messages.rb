class CreateDealMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :deal_messages do |t|
      t.text :message, null: false
      t.references :deal, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
