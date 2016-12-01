json.array!(@player_messages) do |player_message|
  json.extract! player_message, :id, :player_id, :message_id, :status
  json.url player_message_url(player_message, format: :json)
end
