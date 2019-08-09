# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, add_index :users, email, unique: true|
|password|string|null: false|

### Association
- has_many :buyer_deals, foreign_key:'buyer_id', class_name:'Deal'
- has_many :seller_deals, foreign_key:'seller_id', class_name:'Deal'
- has_many :sold_items, { where("buyer_id is not NULL") }, foreign_key:'seller_id', class_name:'Item'
- has_many :reviews, dependent::destroy
- has_many :deals, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :credit_card, dependent::destroy
- has_one :bank_account, dependent::destroy
- has_one :provider, dependent::destroy
- has_one :profile, dependent::destroy
- has_one :address, dependent::destroy


## user_informationsテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null :false|
|first_name|string|null :false|
|last_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birth_year|date|null :false|
|birth_month|date|null :false|
|birth_date|date|null :false|
|phone_number|integer|null :false, unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


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


## bank_accountsテーブル

|Column|Type|Options|
|------|----|-------|
|holder|string|null: false|
|account_number|integer|null: false|
|account_type|string|null: false|
|bank_name|string|null: false|
|bank_code|integer|null: false|
|branch_name|string|null: false|
|branch_code|integer|null: false|
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


## addressesテーブル

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
|item_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|status|integer|default: 0|


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
|status|integer|null: false|

### Association
- has_many :item_images, dependent::destroy
- has_many :likes, dependent::destroy
- has_many :comments, dependent::destroy
- has_one :review, dependent::destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ancestry|string|null: true|
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
