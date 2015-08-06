json.array!(@test_details) do |test_detail|
  json.extract! test_detail, :id, :name, :count, :part_count, :study_id
  json.url test_detail_url(test_detail, format: :json)
end
