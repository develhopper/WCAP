json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :name, :supervisor_id
  json.url clinic_url(clinic, format: :json)
end
