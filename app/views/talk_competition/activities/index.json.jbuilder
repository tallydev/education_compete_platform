json.array!(@talk_competition_activities) do |talk_competition_activity|
  json.extract! talk_competition_activity, :id
  json.url talk_competition_activity_url(talk_competition_activity, format: :json)
end
