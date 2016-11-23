json.array!(@resourse_videos) do |resourse_video|
  json.extract! resourse_video, :id, :type, :video_type, :catalog
  json.url resourse_video_url(resourse_video, format: :json)
end
