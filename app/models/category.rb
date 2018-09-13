class Category < ApplicationRecord
  has_many :exercise_categories
  has_many :exercises, through: :exercise_categories
  has_many :muscles, through: :exercises
  validates :name, presence: true



  def self.find_exercises_by_category(name)
    Exercise.all.select do |exercise|
      exercise.category == name
    end
  end

end
