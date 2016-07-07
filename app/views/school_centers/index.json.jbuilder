json.array!(@school_centers) do |school_center|
  json.extract! school_center, :id
  json.url school_center_url(school_center, format: :json)
end
