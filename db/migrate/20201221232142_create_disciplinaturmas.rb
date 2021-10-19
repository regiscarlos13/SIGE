class CreateDisciplinaturmas < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplinaturmas, id: :uuid do |t|
      t.references :turma, type: :uuid, foreign_key: true
      t.references :teacher, type: :uuid, foreign_key: true
      t.references :subject, type: :uuid, foreign_key: true
      t.integer :hora

      t.timestamps
    end
  end
end
