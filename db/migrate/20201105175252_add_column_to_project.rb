class AddColumnToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :start_at, :datetime
    add_column :projects, :end_at, :datetime
  end
end
