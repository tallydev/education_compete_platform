json.resourse_videos (@resourse_videos) do |resourse_video|
  json.extract! resourse_video, :id, :type, :video_type, :catalog, :created_at, :updated_at
  json.video resourse_video.video.file.try(:url)
  json.url resourse_video_url(resourse_video, format: :json)
end
