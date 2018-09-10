class Workout < ApplicationRecord
  has_many :user_fav_workouts
  has_many :workout_muscles
  has_many :muscles, through: :workout_muscles
end
