class CreateDattributes < ActiveRecord::Migration[7.1]
  def change
    create_table :dattributes do |t|
      t.string :name
      t.references :dclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
