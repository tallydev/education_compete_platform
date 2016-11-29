json.array!(@training_course_teachers) do |training_course_teacher|
  json.extract! training_course_teacher, :id
  json.url training_course_teacher_url(training_course_teacher, format: :json)
end
