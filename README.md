# DB設計

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|buyer_id|references|foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|status|string|null: false|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|size|string|
|condition|string|
|introduction|text|
|delivery|references|null: false, foreign_key: true|

### Association
- has_many :images, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :delivery,dependent::destroy
- belongs_to :user,class_name:"User",foreign_key:"seller_id"
- belongs_to :user,class_name:"User",foreign_key:"burer_id"
- belongs_to :brand
- belongs_to :category


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, add_index :users, email, unique: true|
|password|string|null: false|
|phone_number|string|null :false, add_index :users,phone_number, unique: true|
|last_name|string|null :false|
|first_name|string|null :false|
|last_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birthday|date|null :false|
|avatar_image|text|
|introduction|text|
|postcode|string|null :false|
|prefecture||null :false|
|city|string|null :false|
|block|string|null :false|
|building|string||
|payment|string|null :false|
|provider|string||
|token|string|null :false|

### Association
- has_many :items, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :credit_card, dependent::destroy


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|path|string|null: false|

### Association
- has_many :items
- has_ancestry


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false| foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|token|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## providersテーブル

|Column|Type|Options|
|------|----|-------|
|provider_name|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user

## deliveriesテーブル

|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|null: false|
|origin_region|string|
|shipping_days|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item