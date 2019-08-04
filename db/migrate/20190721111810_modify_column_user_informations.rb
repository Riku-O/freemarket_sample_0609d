class ModifyColumnUserInformations < ActiveRecord::Migration[5.2]
  def up
    change_column :user_informations, :birth_year, :integer
    change_column :user_informations, :birth_month, :integer
    change_column :user_informations, :birth_date, :integer
  end

  def down
    change_column :user_informations, :birth_year, :date
    change_column :user_informations, :birth_month, :date
    change_column :user_informations, :birth_date, :date
  end
end
