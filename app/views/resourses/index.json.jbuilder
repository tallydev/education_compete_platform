json.array!(@resourses) do |resourse|
  json.extract! resourse, :id, :type, :resourse_type, :catalog
  json.url resourse_url(resourse, format: :json)
end
