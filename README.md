# README

**establish database**

## Users Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|nickname|string|null: false|
|password|string|null :false|
|email|string|null: false|
<<<<<<< Updated upstream
|name_family|string|null: false|
|name_first|string|null: false|
|kana_family|string|null: false|
|kana_first|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
=======
|name|string|null: false|
|name_kana|string|null: false|
|birth|integer|null: false|
>>>>>>> Stashed changes
|tell|string|null: false|
|profit|integer|null: false|
### Association
- has_many :items
- has_one :address


## Addresses Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|municipality|string|null: false|
|house_number|string|null: false|
|building|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Items Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|discription|text||
|price|integer|null: false|
|condition|integer|null: false|
|shipping_charge|integer|null: false|
|shipping_date|integer|null: false|
|prefecture|integer|null: false|
|transaction_status|integer|null: false|
|category_id|iteger|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :item_images
- belongs_to :buyer,class_name: “User”
- belongs_to :seller,class_name: “User”


## Item_images Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|image|integer||
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## Categories Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|parent_id|integer||

### Association
- has_many :items
- has_ancestry
