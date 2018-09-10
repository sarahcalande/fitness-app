class Muscle < ApplicationRecord
  has_many :workout_muscles
  has_many :workouts, through: :workout_muscles
end
