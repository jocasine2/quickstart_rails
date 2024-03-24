class AddNaturalPersonIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :natural_person, null: false, foreign_key: true
  end
end
