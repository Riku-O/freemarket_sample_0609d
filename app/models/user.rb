class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :deals
  has_many :buyer_deals, class_name: 'Deal', foreign_key: 'buyer_id'
  has_many :seller_deals, class_name: 'Deal', foreign_key: 'seller_id'
  has_one :address, dependent: :destroy
end
