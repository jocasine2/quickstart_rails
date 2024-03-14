class CreateDmethods < ActiveRecord::Migration[7.1]
  def change
    create_table :dmethods do |t|
      t.string :signature
      t.references :dclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
