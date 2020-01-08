class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :name_family, :name_first, :kana_family, :kana_first, :postal_code, :prefecture, :municipality, :house_number ,presence: true
end
