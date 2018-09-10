class WorkoutMuscle < ApplicationRecord
  belongs_to :muscle
  belongs_to :workout
end
