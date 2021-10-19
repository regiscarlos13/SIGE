class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :title
      t.date :start
      t.date :end
      t.references :year,type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
