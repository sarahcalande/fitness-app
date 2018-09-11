class CreateUserFavExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fav_exercises do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.timestamps
    end
  end
end
