class AddColumnToMovies < ActiveRecord::Migration
  def change
  	change_table :movies do |t|
  		t.string :pelicula_url
  	end
  	change_column_default :movies, :visualizaciones, 0
  end
end
