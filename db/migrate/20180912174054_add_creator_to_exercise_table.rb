class AddCreatorToExerciseTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :creator_id, :integer, default: nil
  end
end
