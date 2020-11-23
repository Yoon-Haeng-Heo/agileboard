class AddColumnToFunctions < ActiveRecord::Migration[6.0]
  def change
    add_column :functions, :to_do_updated_at, :datetime
    add_column :functions, :in_progress_updated_at, :datetime
    add_column :functions, :complete_updated_at, :datetime
    add_column :functions, :feedback_updated_at, :datetime
    add_column :functions, :end_updated_at, :datetime
  end
end
