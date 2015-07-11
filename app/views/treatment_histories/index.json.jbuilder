json.array!(@treatment_histories) do |treatment_history|
  json.extract! treatment_history, :id, :patient_id, :is_cured, :in_month_treated, :in_year_treat_count, :na_session, :total
  json.url treatment_history_url(treatment_history, format: :json)
end
