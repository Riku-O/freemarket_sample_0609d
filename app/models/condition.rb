class Condition < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  field :name
  add id: 1, name: "新品、未使用"
  add id: 2, name: "未使用に近い"
  add id: 3, name: "目立った傷や汚れなし"
  add id: 4, name: "やや傷や汚れあり"
  add id: 5, name: "傷や汚れあり"
  add id: 6, name: "全体的に状態が悪い"
end