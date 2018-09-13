class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :name
      t.string :week_day
      t.integer :sets
      t.integer :reps
      t.integer :user_id
      t.integer :weight

      t.timestamps
    end
  end
end
