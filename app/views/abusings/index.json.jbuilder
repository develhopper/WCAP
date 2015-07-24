json.array!(@abusings) do |abusing|
  json.extract! abusing, :id, :abusing_profile_id, :drug_type, :first_use_age, :continuous_usage_duration, :count, :abusing_type, :description, :is_mainspring
  json.url abusing_url(abusing, format: :json)
end
