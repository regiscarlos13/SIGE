class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools, id: :uuid do |t|
      t.string :name
      
      t.boolean :bloquear

      t.timestamps
    end
  end
end
