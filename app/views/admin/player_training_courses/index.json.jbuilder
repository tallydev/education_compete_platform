json.array!(@admin_player_training_courses) do |admin_player_training_course|
  json.extract! admin_player_training_course, :id
  json.url admin_player_training_course_url(admin_player_training_course, format: :json)
end
