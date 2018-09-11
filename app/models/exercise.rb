class Exercise < ApplicationRecord
  has_many :exercise_muscles
  has_many :muscles, through: :exercise_muscles
  has_many :categories, through: :exercise_muscles


  def muscle_ids=(arr)
    muscle_ids = arr.select{|id| !id.blank?}
    muscle_ids.each do |id|
      self.muscles << Muscle.find(id)
    end
  end

  def muscle_ids
    self.muscles
  end

  def category_id=(cat_id)
    if !cat_id.blank?
    category_object = Category.find(cat_id)
    self.category = category_object
    self.save
    end
  end

end
