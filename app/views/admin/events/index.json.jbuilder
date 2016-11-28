json.current_page @events.current_page
json.total_pages @events.total_pages

json.events @events, partial: 'events/event', as: :event

json.bulletins @bulletins, partial: 'events/event', as: :event

json.headlines @headlines, partial: 'events/event', as: :event

json.activities @activities, partial: 'events/event', as: :event