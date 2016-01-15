class MoviesDescriptionChange < ActiveRecord::Migration
  def change
    remove_column :movies, :descripcion
    remove_column :movies, :valoracion
    remove_column :movies, :pelicula_url
    remove_column :movies, :video_url
  	add_column :movies, :tipo, :string
  	add_column :movies, :direccion, :string
  	add_column :movies, :produccion, :string
  	add_column :movies, :elenco, :string
  	add_column :movies, :pais, :string
  	add_column :movies, :ano, :string
  	add_column :movies, :duracion, :string
  	add_column :movies, :sinopsis, :text
  	add_column :movies, :id_vimeo, :string
  end
end
