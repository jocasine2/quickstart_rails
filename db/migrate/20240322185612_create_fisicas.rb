class CreateFisicas < ActiveRecord::Migration[7.1]
  def change
    create_table :fisicas do |t|
      t.bigint :pessoa_id
      t.text :cpf

      t.timestamps
    end
  end
end
