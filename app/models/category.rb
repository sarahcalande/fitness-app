class Category < ApplicationRecord
  has_many :exercises_categories
  has_many :exercises, through: :exercises_categories
end
