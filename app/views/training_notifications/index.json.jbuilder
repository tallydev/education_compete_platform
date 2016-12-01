json.current_page @training_notifications.current_page
json.total_pages @training_notifications.total_pages

json.training_notifications @training_notifications, partial: 'training_notifications/training_notification', as: :training_notification