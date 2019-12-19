# README

**establish database**

## Users Table

|Column|Type|Options|
|------|----|-------|
|id|integer||
|nickname|string|null: false|
|password|string|null :false|
|email|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
|birth|integer|null: false|
|tell|integer|null: false|
|profit|integer|null: false|
|prefectures|string|null: false|
|address|string|null: false|
|postal_code|integer|null: false|
### Association
- has_many :items, through :users_items
- has_many :users_items

## Items Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|image|text||
|discription|text||
|price|integer|null: false|
|condition_id|references|null: false, foreign_key: true|
|shipping_charge|integer|null: false|
|shipping_date|integer|null: false|
|prefectures_id|references|null: false, foreign_key: true|
|transaction_status|integer|null: false|
|categorys_id|iteger|null: false|
### Association
- has_many :users, through :users_items
- has_many :users_items
- belongs_to :conditions
- belongs_to :categorys
- belongs_to :prefectures


## Categorys Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|parent_id|references|null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|
### Association
- has_many :items

## users_items Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|items_id|references|null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :items

## Conditions Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|status|string|null: false|
|items_id|references|null: false, foreign_key: true|

### Association
- has_many :items

## Prefectures Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|

### Association
- has_many :items
