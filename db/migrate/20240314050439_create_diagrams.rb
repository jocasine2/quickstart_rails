class CreateDiagrams < ActiveRecord::Migration[7.1]
  def change
    create_table :diagrams do |t|
      t.json :entities

      t.timestamps
    end
  end
end
