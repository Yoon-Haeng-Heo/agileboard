class CreateFunctions < ActiveRecord::Migration[6.0]
  def change
    create_table :functions do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
