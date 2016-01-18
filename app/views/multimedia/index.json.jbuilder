json.array!(@multimedia) do |multimedium|
  json.extract! multimedium, :id, :imagen, :titulo, :video_url
  json.url multimedium_url(multimedium, format: :json)
end
