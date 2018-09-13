class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises

  def exercise_ids=(arr)
    self.exercises.clear
    exercise_ids = arr.select{|id| !id.blank?}
    exercise_ids.each do |id|
      self.exercises << Exercise.find(id)
    end
  end

  def exercise_ids
    self.exercises
  end
end
