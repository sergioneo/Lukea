json.array!(@movies) do |movie|
  json.extract! movie, :id, :titulo, :descripcion, :visualizaciones, :image
  json.url movie_url(movie, format: :json)
end
