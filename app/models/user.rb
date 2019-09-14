class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :deals
  # has_many :buyer_deals, class_name: 'Deal', foreign_key: 'buyer_id'
  # has_many :seller_deals, class_name: 'Deal', foreign_key: 'seller_id'
  # has_one :user_information
  # has_one :address, dependent: :destroy
  # has_one :user_information, dependent: :destroyvalidates :nickname, presence: true, length: { maximum: 50 }
  # validates :nickname, {presence: true, length: { maximum: 20 }}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  # validates :encrypted_password, {presence: true, length: { in: 7..128 }, format: { with: /\A[a-z0-9]+\z/i } }

end
