class DealMessage < ApplicationRecord
  belongs_to :deal
  belongs_to :user
end
