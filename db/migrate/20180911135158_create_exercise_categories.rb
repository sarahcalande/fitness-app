class CreateExerciseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_categories do |t|
      t.integer :category_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end
