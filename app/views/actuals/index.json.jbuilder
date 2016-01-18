json.array!(@actuals) do |actual|
  json.extract! actual, :id, :titulo, :imagen_url, :categoria_id, :bajada, :autor, :contenido
  json.url actual_url(actual, format: :json)
end
