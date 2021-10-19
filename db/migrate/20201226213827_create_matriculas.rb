class CreateMatriculas < ActiveRecord::Migration[6.0]
  def change
    create_table :matriculas, id: :uuid do |t|
      t.references :year,  type: :uuid,  foreign_key: true
      t.references :student,  type: :uuid, foreign_key: true
      t.references :turma,  type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
