class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.string :titulo
      t.string :imagen_url
      t.references :category, index: true, foreign_key: true
      t.string :bajada
      t.string :autor
      t.text :contenido

      t.timestamps null: false
    end
  end
end
