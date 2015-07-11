json.array!(@abusing_profiles) do |abusing_profile|
  json.extract! abusing_profile, :id, :cost_per_month, :overdose_count, :freakout_count, :patient_id
  json.url abusing_profile_url(abusing_profile, format: :json)
end
