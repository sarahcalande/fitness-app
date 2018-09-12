class User < ApplicationRecord
  has_secure_password
  has_many :user_fav_exercises
  has_many :exercises, through: :user_fav_exercises
  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
end
