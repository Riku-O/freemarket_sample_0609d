class DealMessage < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  validates :user_id, presence: true
  validates :message, presence: true
  validates :user_id, presence: true

end
