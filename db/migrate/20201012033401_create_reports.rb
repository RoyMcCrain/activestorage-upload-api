class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :memo
      t.string :pic

      t.timestamps
    end
  end
end
