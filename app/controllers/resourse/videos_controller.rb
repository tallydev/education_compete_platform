class Resourse::VideosController < ApplicationController
  before_action :set_resourse_video, only: [:show, :destroy, :download]

  respond_to :json

  def index
    @resourse_videos = Resourse::Video.all
                                      .order_desc
                                      .page(params[:page])
                                      .per(15)
    respond_with(@resourse_videos)
  end

  def show
    respond_with(@resourse_video)
  end

  def create
    @resourse_video = Resourse::Video.new(resourse_video_params)
    if @resourse_video.save
      respond_with(@resourse_video)   
    else
      @error = "上传失败 ！"
      respond_with(@error)
    end 
  end

  # def update
  #   @resourse_video.update(resourse_video_params)
  #   respond_with(@resourse_video)
  # end

  def destroy
    @resourse_video.destroy
    respond_with(@resourse_video)
  end

  def download
    if @resourse_video.present?
      send_file @resourse_video.media.file.path,
        type: @resourse_video.media.file.content_type,
        x_sendfile: true
    else
      @error = "下载的内容不存在 ！"
      respond_with(@error)
    end
  end

  private
    def set_resourse_video
      @resourse_video = Resourse::Video.find(params[:id])
    end

    def resourse_video_params
      params.require(:resourse_video).permit(
        videos_attributes: [:id, :media, :_destroy]
        )
    end
end
