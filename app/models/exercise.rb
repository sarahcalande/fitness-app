class Exercise < ApplicationRecord
  has_many :exercise_muscles
  has_many :muscles, through: :exercise_muscles
  has_many :exercise_categories
  has_many :categories, through: :exercise_categories


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
