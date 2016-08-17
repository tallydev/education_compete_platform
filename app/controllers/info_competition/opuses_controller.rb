class InfoCompetition::OpusesController < ApplicationController
  before_action :set_info_competition_opus, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_player!, only: [:new, :create, :update, :edit]

  respond_to :html

  def index
    @info_competition_opuses = InfoCompetition::Opus.all
    respond_with(@info_competition_opuses)
  end

  def show
    @recruit = @info_competition_opus.recruit
    @player_info = @recruit.player.info
    @mark = @recruit.marks.where(current_expert.id)
    p "============================"
    p @mark
    respond_with(@info_competition_opus)
  end

  # def new
  #   @info_competition_opus = InfoCompetition::Opus.new
  #   respond_with(@info_competition_opus)
  # end

  def create
    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = @info_competition_recruit.build_opus(info_competition_opus_params)
    @info_competition_opus.save
    logger.info "errors is:#{@info_competition_opus.errors}"
    respond_with(@info_competition_opus)
  end

  def new
    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = @info_competition_recruit.opus || @info_competition_recruit.build_opus
    respond_with(@info_competition_opus)
  end

  def edit
    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = InfoCompetition::Opus.find(params[:id])
  end


  def update
    @info_competition_opus.update(info_competition_opus_params)

    logger.info "+++++++++++++++++++++++++++++++"
    respond_with(@info_competition_opus)
  end

  def destroy
    @info_competition_opus.destroy
    respond_with(@info_competition_opus)
  end

  private
    def set_info_competition_opus
      @info_competition_opus = InfoCompetition::Opus.find(params[:id])
    end

    def info_competition_opus_params
      params.require(:info_competition_opus).permit(:recruit_id, :content,
            media_attributes: [:id, :file, :_destroy],
            plan_attributes: [:id, :file, :_destroy],
            ppt_attributes: [:id, :file, :_destroy],
            note_attributes: [:id, :file, :_destroy],
            )
    end
end
