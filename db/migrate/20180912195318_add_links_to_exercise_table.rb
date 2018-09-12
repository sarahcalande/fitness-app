class AddLinksToExerciseTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :image_url, :string
  end
end
