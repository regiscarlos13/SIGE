class AddSchoolIdToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :cpf, :string
  	add_column :users, :name, :string
    add_reference :users, :school, type: :uuid, foreign_key: true
  end
end
