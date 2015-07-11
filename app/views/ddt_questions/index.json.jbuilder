json.array!(@ddt_questions) do |ddt_question|
  json.extract! ddt_question, :id, :definite_value, :indefinite_value, :risk_rate, :question_type
  json.url ddt_question_url(ddt_question, format: :json)
end
