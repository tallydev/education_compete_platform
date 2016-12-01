json.array!(@training_notifications) do |training_notification|
  json.extract! training_notification, :id
  json.url training_notification_url(training_notification, format: :json)
end
