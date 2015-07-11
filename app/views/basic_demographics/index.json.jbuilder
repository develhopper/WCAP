json.array!(@basic_demographics) do |basic_demographic|
  json.extract! basic_demographic, :id, :patient_id, :file_number, :private_code, :gender, :year_of_birth, :interview_date, :marital_status, :educational_year
  json.url basic_demographic_url(basic_demographic, format: :json)
end
