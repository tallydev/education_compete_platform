json.array!(@admin_teachers) do |admin_teacher|
  json.extract! admin_teacher, :id
  json.url admin_teacher_url(admin_teacher, format: :json)
end
