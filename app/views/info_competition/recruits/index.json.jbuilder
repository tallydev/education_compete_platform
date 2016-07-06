json.array!(@info_competition_recruits) do |info_competition_recruit|
  json.extract! info_competition_recruit, :id
  json.url info_competition_recruit_url(info_competition_recruit, format: :json)
end
