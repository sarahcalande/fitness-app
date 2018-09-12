class AddLinksToMusclesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :muscles, :image_url, :string
  end
end
