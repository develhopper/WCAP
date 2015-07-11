json.array!(@studies) do |study|
  json.extract! study, :id, :admin_id, :description
  json.url study_url(study, format: :json)
end
