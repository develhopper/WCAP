json.array!(@tasks) do |task|
  json.extract! task, :id, :confirmed, :study_id, :patient_id
  json.url task_url(task, format: :json)
end
