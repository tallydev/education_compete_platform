json.array!(@journals) do |journal|
  json.extract! journal, :id, :player_id, :training_course_id, :title, :content, :add_date
  json.url journal_url(journal, format: :json)
end
