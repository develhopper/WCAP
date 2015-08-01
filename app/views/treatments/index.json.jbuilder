json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :treatment_history_id, :treatment_type, :count, :max_avoidance_day, :description, :in_month_used
  json.url treatment_url(treatment, format: :json)
end
