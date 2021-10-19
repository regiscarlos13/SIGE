class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series, id: :uuid do |t|
      t.string :name
      t.references :school, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
