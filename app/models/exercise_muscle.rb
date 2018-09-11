class ExerciseMuscle < ApplicationRecord
  belongs_to :muscle
  belongs_to :exercise
end
