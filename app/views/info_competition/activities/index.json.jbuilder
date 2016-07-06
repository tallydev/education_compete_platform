json.array!(@info_competition_activities) do |info_competition_activity|
  json.extract! info_competition_activity, :id
  json.url info_competition_activity_url(info_competition_activity, format: :json)
end
