class ResourceLibrariesController < ApplicationController
  before_action :set_resource_library, only: [:show, :destroy, :download]

  respond_to :json

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
      p    video_params
      p    document_params
      p    form_params
      p    courseware_params
      p    picture_params
      p    audio_params
    if @resource_library.save
      case @resource_library.catalog
        when "video"
          if video_params.present?
            @resource_library.update(video_params)
            respond_with(@resource_library)
          else
            @error = "video_params is nil, uploadfile faiure !"
            respond_with(@error, template: "error")    
          end
        when "document"
          if document_params.present?
            @resource_library.update(document_params)
             respond_with(@resource_library)
          else
            @error = "document_params is nil, uploadfile faiure !"
            respond_with(@error, template: "error")   
          end
        when "form"
          if form_params.present?
            @resource_library.update(form_params)
            respond_with(@resource_library)
          else
            @error = "form_params is nil, uploadfile faiure !"
            respond_with(@error, template: "error")   
          end
        when "courseware"
          if courseware_params.present?
            @resource_library.update(courseware_params)
            respond_with(@resource_library)
          else
            @error = "courseware is nil, uploadfile faiure !"
            respond_with(@error, template: "error")    
          end        
        when "picture"
          if picture_params.present?
            @resource_library.update(picture_params) 
            respond_with(@resource_library)
            p  @resource_library.picture  
          else
            @error = "picture_params is nil, uploadfile faiure !"
            respond_with(@error, template: "error")
          end
        when "audio"
          if audio_params.present?
            @resource_library.update(audio_params)
            respond_with(@resource_library)
          else
            @error = "audio_params is nil, uploadfile faiure !"
            respond_with(@error, template: "error")
          end 
      end 
    else
      @error = "上传失败 ！"
      respond_with(@error, template: "error")
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
      respond_with(@error, template: "error")
    end
  end

  def download
    if @resource_library.present?
      case @resource_library.catalog
        when "video"
          unless @resource_library.video.blank?
            send_file @resource_library.video.path,
            type: @resource_library.video.content_type,
            x_sendfile: true
          else
            @error = "video没有记录，下载失败！ ！"
            respond_with(@error, template: "error")
          end
        when "document"
          unless @resource_library.document.blank?
            send_file @resource_library.document.path,
            type: @resource_library.document.content_type,
            x_sendfile: true
          else
            @error = "document没有记录，下载失败！ ！"
            respond_with(@error, template: "error")
          end
        when "form"
          unless @resource_library.form.blank?
            send_file @resource_library.form.path,
            type: @resource_library.form.content_type,
            x_sendfile: true
          else
            @error = "form没有记录，下载失败！ ！"
            respond_with(@error, template: "error")
          end
        when "courseware"
          unless @resource_library.courseware.blank?
            send_file @resource_library.courseware.path,
            type: @resource_library.courseware.content_type,
            x_sendfile: true
          else
            @error = "courseware没有记录，下载失败！ ！"
            respond_with(@error, template: "error")
          end       
        when "picture"
          unless @resource_library.picture.blank?
            send_file @resource_library.picture.path,
            type: @resource_library.picture.content_type,
            x_sendfile: true
          else
            @error = "picture没有记录，下载失败！ ！"
            respond_with(@error, template: "error")
          end
        when "audio"
          unless @resource_library.audio.blank?
            send_file @resource_library.audio.path,
            type: @resource_library.audio.content_type,
            x_sendfile: true
          else
            @error = "audio没有记录，下载失败！ ！"
            respond_with(@error, )
          end
      end
    else
      @error = "下载的内容不存在 ！"
      respond_with(@error, template: "error")
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
