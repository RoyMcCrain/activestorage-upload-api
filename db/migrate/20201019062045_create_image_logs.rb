class CreateImageLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :image_logs do |t|
      t.datetime "uploaded_at", null: false

      t.integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
