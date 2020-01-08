class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< Updated upstream
         :recoverable, :rememberable, :validatable, password_length: 7..128
  validates :nickname, :name_family, :name_first, :kana_family, :kana_first, :birthday, :tel, :profit ,presence: true
  validates :tel, uniqueness: true
  has_one :address
=======
         :recoverable, :rememberable, :validatable
  validates :nickname, :name, :name_kana, :birth, :tell ,presence: true
>>>>>>> Stashed changes
end
