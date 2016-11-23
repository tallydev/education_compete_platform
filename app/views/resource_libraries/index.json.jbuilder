json.array!(@resource_libraries) do |resource_library|
  json.extract! resource_library, :id, :title, :catalog, :mdate, :created_at, :updated_at
  case params[:catalog]
   	when "1"
    	json.video resource_library.video.file.try(:url)
   	when "2"
   		json.video resource_library.document.file.try(:url)
   	when "3"
   		json.video resource_library.form.file.try(:url)
   	when "4"
   		json.video resource_library.courseware.file.try(:url)
   	when "5"
   		json.video resource_library.picture.file.try(:url)
   	when "6"
   		json.video resource_library.audio.file.try(:url)
  end	
  json.url resource_library_url(resource_library, format: :json)
end
