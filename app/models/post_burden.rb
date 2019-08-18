class PostBurden < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  field :name
  add id: 1, name: "送料込み(出品者負担)"
  add id: 2, name: "着払い(購入者負担)"
end