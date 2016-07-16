class InfoCompetition::OpusesController < ApplicationController
  before_action :set_info_competition_opus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_opuses = InfoCompetition::Opus.all
    respond_with(@info_competition_opuses)
  end

  def show
    @recruit = @info_competition_opus.recruit
    @player_info = @recruit.player.info
    respond_with(@info_competition_opus)
  end

  # def new
  #   @info_competition_opus = InfoCompetition::Opus.new
  #   respond_with(@info_competition_opus)
  # end

  def create
    @info_competition_opus = InfoCompetition::Opus.new(info_competition_opus_params)
    @info_competition_opus.save
    respond_with(@info_competition_opus)
  end

  def new
    @first_opus = current_player.recruits.blank? ? nil : current_player.recruits.first
    @player = current_player.try(:info)

    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = @info_competition_recruit.build_opus
    respond_with(@info_competition_opus)
  end

  def edit
  end


  def update
    @info_competition_opus.update(info_competition_opus_params)
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
      params.require(:info_competition_opus).permit(:recruit_id, 
            media_attributes: [:id, :file, :_destroy],
            plan_attributes: [:id, :file, :_destroy],
            ppt_attributes: [:id, :file, :_destroy],
            note_attributes: [:id, :file, :_destroy],
            )
    end

end
