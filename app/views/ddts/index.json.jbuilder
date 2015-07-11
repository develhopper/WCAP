json.array!(@ddts) do |ddt|
  json.extract! ddt, :id
  json.url ddt_url(ddt, format: :json)
end
