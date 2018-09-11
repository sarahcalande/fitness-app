class Category < ApplicationRecord
  has_many :exercise_categories
  has_many :exercises, through: :exercise_categories
  has_many :muscles, through: :exercises
end
