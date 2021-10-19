class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students, id: :uuid do |t|
      t.string :name
      t.string :rg
      t.date :nascimento
      t.string :censo
      t.string :mae
      t.string :pai
      t.string :cpf
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :rua
      t.string :uf
      t.string :numero
      t.string :complemento
      t.string :naturalidade
      t.integer :sexo
      t.boolean :necessidade
      t.references :school, type: :uuid, foreign_key: true

      t.string :cpfmae
      t.string :cpfpai
      t.string :telefone
      t.string :email

      t.string :cpf_financeiro
      t.string :nome_financeiro
      t.string :cep_financeiro
      t.string :bairro_financeiro
      t.string :cidade_financeiro
      t.string :rua_financeiro
      t.string :uf_financeiro
      t.string :numero_financeiro
      t.string :complemento_financeiro
      



      t.timestamps
    end
  end
end
