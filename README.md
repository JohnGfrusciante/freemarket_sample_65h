# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
|adress|string|null: false|
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
|condition_id|integer|null: false|
|shipping_charge|integer|null: false|
|shipping_date|integer|null: false|
|prefectures_id|integer|null: false|
|transaction_status|integer|null: false|
### Association
- has_many :users, through :users_items
- has_many :users_items
- belongs_to :conditions
- belongs_to :categorys_large
- belongs_to :categorys_middle
- belongs_to :categorys_small
- belongs_to :prefectures


## Categorys_large Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|categorys_middle_id|references|null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|
### Association
- has_many :items
- has_many :categorys_middle

## Categorys_middle Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|categorys_small_id|references|null: false, foreign_key: true|
|items_id|references|null: false, foreign_key: true|
### Association
- has_many :items
- has_many :categorys_small
- belongs_to :categorys_large

## Categorys_small Table
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null: false|
|items_id|references|null: false, foreign_key: true|
### Association
- has_many :items
- belongs_to :categorys_middle

## users_items Table
|id|integer||
|seller_id|integer|null: false|
|buyer_id|integer||
|items_id|integer|null: false|

### Association
- belongs_to :users
- belongs_to :items

## Conditions Table
|id|integer||
|status|string|null: false|
|items_id|integer|null: false|

### Association
- has_many :items

## Prefectures Table
|id|integer||
|name|string|null: false|

### Association
- has_many :items