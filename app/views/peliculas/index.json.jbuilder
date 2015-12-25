json.array!(@peliculas) do |pelicula|
  json.extract! pelicula, :id, :titulo, :descripcion, :n_visualizaciones
  json.url pelicula_url(pelicula, format: :json)
end
