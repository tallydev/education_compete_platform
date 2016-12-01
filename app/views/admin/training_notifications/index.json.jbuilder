json.array!(@admin_training_notifications) do |admin_training_notification|
  json.extract! admin_training_notification, :id
  json.url admin_training_notification_url(admin_training_notification, format: :json)
end
