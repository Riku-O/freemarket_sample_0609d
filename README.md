# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, add_index :users, email, unique: true|
|password|string|null: false|
|last_name|string|null :false|
|first_name|string|null :false|
|last_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birth_year|date|null :false|
|birth_month|date|null :false|
|birth_date|date|null :false|
|phone_number|integer|null :false, add_index :users,phone_number, unique: true|

### Association
- has_many :buyed_items, foreign_key:'buyer_id', class_name:'Item'
- has_many :selling_items, { where("buyer_id is NULL") }, foreign_key:'seller_id', class_name:'Item'
- has_many :sold_items, { where("buyer_id is not NULL") }, foreign_key:'seller_id', class_name:'Item'
- has_many :deal_reviews, dependent::destroy
- has_many :completed_deals, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :credit_card, dependent::destroy
- has_one :provider, dependent::destroy
- has_one :profile, dependent::destroy
- has_one :address, dependent::destroy


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|validity_month|integer|null: false|
|validity_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## providersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|avatar_image|text|
|introduction|text|
|user_id|references|null: false, foreign_key: true|

### Association
-belongs_to :user


## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postcode|string|null :false|
|prefecture|string|null :false|
|city|string|null :false|
|block|string|null :false|
|building|string|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## dealsテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :buyer, class_name: "User"
- belongs_to :seller, class_name: "User"
- belongs_to :item


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size|integer|
|condition|string|null: false|
|postage_burden|integer|null: false|
|shipping_method|string|null: false|
|source_area|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|state|string|null: false|

### Association
- has_many :images, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :review, dependent::destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|path|string|null: false|
|item|string|null: false|

### Association
- has_many :items
- has_ancestry


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
