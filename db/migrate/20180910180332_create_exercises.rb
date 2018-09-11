class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.timestamps
    end
  end
end
