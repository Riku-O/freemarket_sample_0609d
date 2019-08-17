class ShippingDate < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  field :name
  add id: 1, name: "1~2日で発送"
  add id: 2, name: "2~3日で発送"
  add id: 3, name: "4~7日で発送"
end