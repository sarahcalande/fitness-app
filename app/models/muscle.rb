class Muscle < ApplicationRecord
  has_many :exercise_muscles
  has_many :exercises, through: :exercise_muscles



    def self.find_muscles_by_category(name)
      Muscle.all.select do |muscle|
        muscle.category == name
      end
    end


end
