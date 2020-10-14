class AddColumnToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :order, :integer, null: false, default: 1
  end
end
