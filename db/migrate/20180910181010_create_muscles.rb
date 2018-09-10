class CreateMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :muscles do |t|
      t.string :name
      t.string :body_part
      t.text :description
      t.timestamps
    end
  end
end
