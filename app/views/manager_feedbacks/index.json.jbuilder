json.array!(@manager_feedbacks) do |manager_feedback|
  json.extract! manager_feedback, :id
  json.url manager_feedback_url(manager_feedback, format: :json)
end
