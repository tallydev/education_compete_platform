json.array!(@center_info_competitions) do |center_info_competition|
  json.extract! center_info_competition, :id
  json.url center_info_competition_url(center_info_competition, format: :json)
end
