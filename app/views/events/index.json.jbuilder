json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :classify, :picture_url, :is_competition, :picture_url
  json.url event_url(event, format: :json)
end
