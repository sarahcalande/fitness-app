class ExerciseCategory < ApplicationRecord
  belongs_to :exercise
  belongs_to :category
end
