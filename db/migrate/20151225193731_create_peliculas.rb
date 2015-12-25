class CreatePeliculas < ActiveRecord::Migration
  def change
    create_table :peliculas do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :n_visualizaciones

      t.timestamps null: false
    end
  end
end
