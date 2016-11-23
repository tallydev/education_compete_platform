class Resourse::VideosController < ApplicationController
  before_action :set_resourse_video, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resourse_videos = Resourse::Video.all
    respond_with(@resourse_videos)
  end

  def show
    respond_with(@resourse_video)
  end

  def new
    @resourse_video = Resourse::Video.new
    respond_with(@resourse_video)
  end

  def edit
  end

  def create
    @resourse_video = Resourse::Video.new(resourse_video_params)
    @resourse_video.save
    respond_with(@resourse_video)
  end

  def update
    @resourse_video.update(resourse_video_params)
    respond_with(@resourse_video)
  end

  def destroy
    @resourse_video.destroy
    respond_with(@resourse_video)
  end

  private
    def set_resourse_video
      @resourse_video = Resourse::Video.find(params[:id])
    end

    def resourse_video_params
      params.require(:resourse_video).permit(:type, :video_type, :catalog)
    end
end
