class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers, id: :uuid do |t|
      t.string :cpf
      t.string :name
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :rua
      t.string :uf
      t.string :numero
      t.string :complemento
       t.references :school, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
