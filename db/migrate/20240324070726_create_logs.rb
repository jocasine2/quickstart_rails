class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity
      t.string :ip_address
      t.string :device_info
      t.string :browser
      t.string :location

      t.timestamps
    end
  end
end
