class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_date, :integer
    add_column :users, :phone_number, :integer
  end

  def down
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :birth_year, :integer
    remove_column :users, :birth_month, :integer
    remove_column :users, :birth_date, :integer
    remove_column :users, :phone_number, :integer
  end
end
