json.current_page @admin_events.current_page
json.total_pages @admin_events.total_pages

json.admin_events @admin_events, partial: 'admin/events/admin_event', as: :admin_event

