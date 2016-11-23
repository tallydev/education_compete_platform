class ResourceLibrariesController < ApplicationController
  before_action :set_resource_library, only: [:show, :destroy, :download]

  respond_to :html

  def index
    number = params[:number]?? params[:number] : 1  # catalog_id
    @resource_libraries = ResourceLibrary.all
                                         .is_catalog(number)
                                         .order_desc
                                         .page(params[:page])
                                         .per(15)
    respond_with(@resource_libraries)
  end

  def show
    respond_with(@resource_library)
  end

  def create
    @resource_library = ResourceLibrary.new(resource_library_params)
    if @resource_library.save
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
    if @resourse_video.present?
      send_file @resourse_video.video.file.path,
        type: @resourse_video.video.file.content_type,
        x_sendfile: true
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
      params.require(:resource_library).permit(
        :title, :catalog, :mdate
        video_attributes: [:id, :file, :_destroy]
        )
    end
end
