json.array!(@talk_competition_recruits) do |talk_competition_recruit|
  json.extract! talk_competition_recruit, :id
  json.url talk_competition_recruit_url(talk_competition_recruit, format: :json)
end
