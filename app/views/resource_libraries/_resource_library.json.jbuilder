json.extract! resource_library, :id, :title, :catalog, :mdate, :created_at, :updated_at
  case resource_library.catalog
   	when "video"
    	json.video resource_library.video.try(:url)
   	when "document"
   		json.document resource_library.document.try(:url)
   	when "form"
   		json.form resource_library.form.try(:url)
   	when "courseware"
   		json.courseware resource_library.courseware.try(:url)
   	when "picture"
   		json.picture resource_library.picture.try(:url)
   	when "audio"
   		json.audio resource_library.audio.try(:url)
  end	
json.url resource_library_url(resource_library, format: :json)