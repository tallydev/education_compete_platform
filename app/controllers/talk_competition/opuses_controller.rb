class TalkCompetition::OpusesController < ApplicationController
  before_action :set_talk_competition_opus, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_player!, only: [:new, :create, :update, :edit]
  respond_to :html

  def index
    @talk_competition_opuses = TalkCompetition::Opus.all
    respond_with(@talk_competition_opuses)
  end

  def show
    @recruit = @talk_competition_opus.recruit
    @player_info = @recruit.player.info
    if current_expert.present?
      @mark = @recruit.marks.where(expert_id:current_expert.id).first
    end
    respond_with(@talk_competition_opus)
  end

  def create
    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
    @talk_competition_opus = @talk_competition_recruit.build_opus(talk_competition_opus_params)
    @talk_competition_opus.save
    respond_with(@talk_competition_opus)
  end

  def new
    @talk_competition_recruit = TalkCompetition::Recruit.find(params[:recruit_id])
    @talk_competition_opus = @talk_competition_recruit.opus || @talk_competition_recruit.build_opus
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
