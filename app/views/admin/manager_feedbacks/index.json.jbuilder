json.array!(@admin_manager_feedbacks) do |admin_manager_feedback|
  json.extract! admin_manager_feedback, :id
  json.url admin_manager_feedback_url(admin_manager_feedback, format: :json)
end
