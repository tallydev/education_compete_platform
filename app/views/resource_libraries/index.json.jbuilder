json.array!(@resource_libraries) do |resource_library|
  json.extract! resource_library, :id, :title, :catalog, :mdate
  json.url resource_library_url(resource_library, format: :json)
end
