class AddColumnNameToMuscles < ActiveRecord::Migration[5.2]
  def change
    add_column :muscles, :category_name, :string
  end
end
