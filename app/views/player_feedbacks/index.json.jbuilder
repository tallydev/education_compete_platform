json.array!(@player_feedbacks) do |player_feedback|
  json.extract! player_feedback, :id
  json.url player_feedback_url(player_feedback, format: :json)
end
