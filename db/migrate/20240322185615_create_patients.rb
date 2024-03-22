class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.bigint :fisica_id
      t.text :sus_card

      t.timestamps
    end
  end
end
