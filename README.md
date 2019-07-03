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
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_date|integer|null :false|
|phone_number|string|null :false, add_index :users,phone_number, unique: true|
|postcode|string|null :false|
|prefecture||null :false|
|city|string|null :false|
|block|string|null :false|
|building|string||

### Association
- has_many :buyed_items, foreign_key:'buyer_id', class_name:'Item'
- has_many :selling_items, foreign_key:'seller_id', class_name:'Item'
- has_many :sold_items, foreign_key:'seller_id', class_name:'Item'
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_many :deals, dependent::destroy
- has_one :profile, dependent::destroy
- has_one :provider, dependent::destroy
- has_one :credit_card, dependent::destroy


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
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## during_dealsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- has_one :completed_deals
- belongs_to :user
- belongs_to :item


## under_exhibitionテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- has_one :completed_deals
- belongs_to :user
- belongs_to :item


## deal_reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|deal_id|references|null: false, foreign_key: true|

### Association
- belongs_to :during_deal


## completed_dealsテーブル

|Column|Type|Options|
|------|----|-------|
|deal_id|references|null: false, foreign_key: true|

### Association
- belongs_to :during_deal


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|buyer_id|references|foreign_key: true|
|seller_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|condition|string|
|shipment_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|description|text|
|deal_id|reference|null: false, foreign_key: true|

### Association
- has_many :images, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- belongs_to :shipment, dependent::destroy
- belongs_to :buyer, class_name:'User', foreign_key:'buyer_id'
- belongs_to :seller, class_name:'User', foreign_key:'seller_id'
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :deal


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


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


## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :item


## shipmentsテーブル

|Column|Type|Options|
|------|----|-------|
|postage_burden|string|null: false|
|method|string|null: false|
|source_area|string|
|shipping_date|string|null: false|

### Association
- belongs_to :product