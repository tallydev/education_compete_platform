json.array!(@player_training_courses) do |player_training_course|
  json.extract! player_training_course, :id
  json.url player_training_course_url(player_training_course, format: :json)
end
