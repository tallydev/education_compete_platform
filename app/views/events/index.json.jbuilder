json.current_page @events.current_page
json.total_pages @events.total_pages

json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :classify, :picture_url, :is_competition, :picture_url
  json.url event_url(event, format: :json)
end

json.events @events, partial: 'events/event', as: :event

json.bulletins @bulletins, partial: 'events/event', as: :event

json.headlines @headlines, partial: 'events/event', as: :event

json.activities @activities, partial: 'events/event', as: :event