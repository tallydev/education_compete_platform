json.array!(@player_tasks) do |player_task|
  json.extract! player_task, :id, :title, :content, :appraise, :task_id, :player_id
  json.url player_task_url(player_task, format: :json)
end
