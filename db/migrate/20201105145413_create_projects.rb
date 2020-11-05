class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :project_status
      t.string :image

      t.timestamps
    end
  end
end
