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
          if @resource_library.video.present?
            send_file File.dirname(__FILE__), @resource_library.video,
            type: @resource_library.video.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end
        when "document"
          if @resource_library.document.present?
            send_file File.dirname(__FILE__), @resource_library.document,
            type: @resource_library.document.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end
        when "form"
          if @resource_library.form.present?
            send_file File.dirname(__FILE__), @resource_library.form,
            type: @resource_library.form.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end
        when "courseware"
          if @resource_library.courseware.present?
            send_file File.dirname(__FILE__), @resource_library.courseware,
            type: @resource_library.courseware.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end       
        when "picture"
          if @resource_library.picture
            send_file File.dirname(__FILE__), @resource_library.picture,
            type: @resource_library.picture.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end
        when "audio"
          if @resource_library.audio.present?
            send_file File.dirname(__FILE__), @resource_library.audio,
            type: @resource_library.audio.content_type,
            x_sendfile: true
          else
            @error = "没有记录，下载失败！ ！"
            respond_with(@error)
          end
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
