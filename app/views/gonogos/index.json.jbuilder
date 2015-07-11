json.array!(@gonogos) do |gonogo|
  json.extract! gonogo, :id
  json.url gonogo_url(gonogo, format: :json)
end
