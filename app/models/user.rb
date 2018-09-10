class User < ApplicationRecord
  has_secure_password

  has_many :user_fav_workouts
  has_many :workouts, through: :user_fav_workouts
  has_many :muscles, through: :workouts
end
