class User < ApplicationRecord
  has_secure_password

  has_many :user_fav_exercises
  has_many :exercises, through: :user_fav_exercises
end
