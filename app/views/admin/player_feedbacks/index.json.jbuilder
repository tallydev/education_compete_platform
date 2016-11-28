json.array!(@admin_player_feedbacks) do |admin_player_feedback|
  json.extract! admin_player_feedback, :id
  json.url admin_player_feedback_url(admin_player_feedback, format: :json)
end
