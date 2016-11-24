class ResourceLibrariesController < ApplicationController
  before_action :set_resource_library, only: [:show, :destroy, :download]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    number = params[:number].present?? params[:number] : "1" # catalog_id
    @resource_libraries = ResourceLibrary.all.is_catalog(number).order_desc.paginate(page: page, per_page: per_page)
    respond_with(@resource_libraries)
  end

  def show
    respond_with(@resource_library)
  end

  def create
    @resource_library = ResourceLibrary.new(resource_library_params)
    if @resource_library.save
      case @resource_library.catalog
        when "video"
          if video_params[:file].present?
            @resource_library.update(video_params)
          end
        when "document"
          if document_params[:file].present?
            @resource_library.update(document_params)
          end
        when "form"
          if form_params[:file].present?
            @resource_library.update(form_params)
          end
        when "courseware"
          if courseware_params[:file].present?
            @resource_library.update(courseware_params)
          end        
        when "picture"
          if picture_params[:file].present?
            @resource_library.update(picture_params)
          end
        when "audio"
          if audio_params[:file].present?
            @resource_library.update(audio_params)
          end 
      end 
      respond_with(@resource_library)   
    else
      @error = "上传失败 ！"
      respond_with(@error)
    end 
  end

  # def update
  #   @resource_library.update(resource_library_params)
  #   respond_with(@resource_library)
  # end

  def destroy
    if @resource_library.present?
      @resource_library.destroy
      respond_with(@resource_library)
    else
      @error = "内容不存在 ！"
      respond_with(@error)
    end
  end

  def download
    if @resource_library.present?
      case @resource_library.catalog
        when "video"
          send_file @resource_library.video.file.path,
          type: @resource_library.video.file.content_type,
          x_sendfile: true
        when "document"
          send_file @resource_library.document.file.path,
          type: @resource_library.document.file.content_type,
          x_sendfile: true
        when "form"
          send_file @resource_library.form.file.path,
          type: @resource_library.form.file.content_type,
          x_sendfile: true
        when "courseware"
          send_file @resource_library.courseware.file.path,
          type: @resource_library.courseware.file.content_type,
          x_sendfile: true         
        when "picture"
          send_file @resource_library.picture.file.path,
          type: @resource_library.picture.file.content_type,
          x_sendfile: true
        when "audio"
          send_file @resource_library.audio.file.path,
          type: @resource_library.audio.file.content_type,
          x_sendfile: true
      end
    else
      @error = "下载的内容不存在 ！"
      respond_with(@error)
    end
  end

  private
    def set_resource_library
      @resource_library = ResourceLibrary.find(params[:id])
    end

    def resource_library_params
      params.require(:resource_library).permit(:title, :catalog)
    end

    def video_params
      params.require(:resource_library).permit(video_attributes: [:id, :file, :_destroy])
    end

    def document_params
      params.require(:resource_library).permit(document_attributes: [:id, :file, :_destroy])
    end

    def form_params
      params.require(:resource_library).permit(form_attributes: [:id, :file, :_destroy])
    end

    def courseware_params
      params.require(:resource_library).permit(courseware_attributes: [:id, :file, :_destroy])
    end

    def picture_params
      params.require(:resource_library).permit(picture_attributes: [:id, :file, :_destroy])
    end

    def audio_params
      params.require(:resource_library).permit(audio_attributes: [:id, :file, :_destroy])
    end
end
