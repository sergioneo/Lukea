class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :visualizaciones
      t.string :image

      t.timestamps null: false
    end
  end
end
