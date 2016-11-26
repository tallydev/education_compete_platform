json.array!(@training_courses) do |training_course|
  json.extract! training_course, :id
  json.url training_course_url(training_course, format: :json)
end
