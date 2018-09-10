class CreateWorkoutMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_muscles do |t|
      t.integer :workout_id
      t.integer :muscle_id
      t.timestamps
    end
  end
end
