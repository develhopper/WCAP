json.array!(@ddt_answers) do |ddt_answer|
  json.extract! ddt_answer, :id
  json.url ddt_answer_url(ddt_answer, format: :json)
end
