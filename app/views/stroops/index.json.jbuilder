json.array!(@stroops) do |stroop|
  json.extract! stroop, :id, :duration, :total_items, :correct_items, :finished
  json.url stroop_url(stroop, format: :json)
end
