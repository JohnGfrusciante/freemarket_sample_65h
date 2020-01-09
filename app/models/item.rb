class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :item_images
end
