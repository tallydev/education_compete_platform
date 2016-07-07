json.array!(@center_talk_competitions) do |center_talk_competition|
  json.extract! center_talk_competition, :id
  json.url center_talk_competition_url(center_talk_competition, format: :json)
end
