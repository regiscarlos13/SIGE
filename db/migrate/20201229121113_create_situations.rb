class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations, id: :uuid do |t|
      t.references :matricula, type: :uuid, foreign_key: true
      t.integer :tipo
      t.integer :situacao

      t.timestamps
    end
  end
end
