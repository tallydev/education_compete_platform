json.array!(@player_infos) do |player_info|
  json.extract! player_info, :id
  json.url player_info_url(player_info, format: :json)
end
