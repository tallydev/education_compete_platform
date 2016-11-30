json.array!(@admin_training_courses) do |admin_training_course|
  json.extract! admin_training_course, :id
  json.url admin_training_course_url(admin_training_course, format: :json)
end
