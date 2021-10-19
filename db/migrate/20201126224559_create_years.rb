class CreateYears < ActiveRecord::Migration[6.0]
  def change
    create_table :years, id: :uuid do |t|
      t.integer :year
      t.decimal :media

      t.date :inicio
      t.date :fim

      t.date :inicio1
      t.date :fim1
      t.date :inicio2
      t.date :fim2
      t.date :inicio3
      t.date :fim3
      t.date :inicio4
      t.date :fim4
      t.date :inicior
      t.date :fimr






      t.boolean :concluido
      t.references :school, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
