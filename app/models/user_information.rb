class UserInformation < ApplicationRecord
  belongs_to :user
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true

end
