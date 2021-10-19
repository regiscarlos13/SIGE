class CreateTurmas < ActiveRecord::Migration[6.0]
  def change
    create_table :turmas, id: :uuid do |t|
      t.string :name
      t.references :serie, type: :uuid, foreign_key: true
      t.references :year, type: :uuid, foreign_key: true


      t.timestamps
    end
  end
end
