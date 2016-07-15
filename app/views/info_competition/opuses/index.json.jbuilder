json.array!(@info_competition_opuses) do |info_competition_opus|
  json.extract! info_competition_opus, :id
  json.url info_competition_opus_url(info_competition_opus, format: :json)
end
