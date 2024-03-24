class CreateNaturalPeople < ActiveRecord::Migration[7.1]
  def change
    create_table :natural_people do |t|
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
