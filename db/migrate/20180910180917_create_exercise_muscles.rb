class CreateExerciseMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_muscles do |t|
      t.integer :exercise_id
      t.integer :muscle_id
      t.timestamps
    end
  end
end
