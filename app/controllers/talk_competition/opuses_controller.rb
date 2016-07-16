class TalkCompetition::OpusesController < ApplicationController
  before_action :set_talk_competition_opus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @talk_competition_opuses = TalkCompetition::Opus.all
    respond_with(@talk_competition_opuses)
  end

  def show
    @recruit = @talk_competition_opus.recruit
    @player_info = @recruit.player.info
    respond_with(@talk_competition_opus)
  end

  # def new
  #   @talk_competition_opus = TalkCompetition::Opus.new
  #   respond_with(@talk_competition_opus)
  # end

  def create
    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
    @talk_competition_opus = @talk_competition_recruit.build_opus(talk_competition_opus_params)
    @talk_competition_opus.save
    respond_with(@talk_competition_opus)
  end

  def new
    @first_opus = current_player.recruits.blank? ? nil : current_player.recruits.first
    @player = current_player.try(:info)

    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
    @talk_competition_opus = @talk_competition_recruit.build_opus
    respond_with(@talk_competition_opus)
  end

  def edit
    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
  end


  def update
    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
    @talk_competition_opus.update(talk_competition_opus_params)
    respond_with(@talk_competition_opus)
  end

  def destroy
    @talk_competition_opus.destroy
    respond_with(@talk_competition_opus)
  end

  private
    def set_talk_competition_opus
      @talk_competition_opus = TalkCompetition::Opus.find(params[:id])
    end

    def talk_competition_opus_params
      params.require(:talk_competition_opus).permit(:recruit_id, :content,
            media_attributes: [:id, :file, :_destroy],
            plan_attributes: [:id, :file, :_destroy],
            ppt_attributes: [:id, :file, :_destroy],
            note_attributes: [:id, :file, :_destroy],
            )
    end

end
