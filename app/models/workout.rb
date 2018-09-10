class Workout < ApplicationRecord
  has_many :user_fav_workouts
  has_many :workout_muscles
  has_many :muscles, through: :workout_muscles

  def muscle_id=(arr)
    muscle_ids = arr.select{|id| !id.empty?}
    muscle_ids.each do |id|
      self.muscles << Muscle.find(id)
    end
  end

  def muscle_id
    self.muscles
  end

end
