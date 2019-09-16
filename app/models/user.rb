class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    
    unless snscredential
      user = User.create(
        nickname: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      SnsCredential.create(
        uid: uid,
        provider: provider,
        user_id: user.id
        )
    end
    user
  end
  
  has_many :items
  has_many :deals
  has_many :buyer_deals, class_name: 'Deal', foreign_key: 'buyer_id'
  has_many :seller_deals, class_name: 'Deal', foreign_key: 'seller_id'
  has_one :address, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_one :user_information, dependent: :destroy
  validates :email, presence: true
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_date, presence: true
end
