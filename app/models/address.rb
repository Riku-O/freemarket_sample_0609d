class Address < ApplicationRecord
  belongs_to :user
#   TODO:ActiveHashのブランチがマージされたら、ActiveHashで定義しているオブジェクトに紐付ける
# has_many :prefectures, class_name: 'SourceArea', foreign_key: 'prefecture_id'
end
