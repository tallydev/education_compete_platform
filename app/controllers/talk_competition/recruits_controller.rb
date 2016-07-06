class TalkCompetition::RecruitsController < ApplicationController
  before_action :set_talk_competition_recruit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @talk_competition_recruits = TalkCompetition::Recruit.all
    respond_with(@talk_competition_recruits)
  end

  def show
    respond_with(@talk_competition_recruit)
  end

  def new
    @talk_competition_recruit = TalkCompetition::Recruit.new
    respond_with(@talk_competition_recruit)
  end

  def edit
  end

  def create
    @talk_competition_recruit = TalkCompetition::Recruit.new(talk_competition_recruit_params)
    @talk_competition_recruit.save
    respond_with(@talk_competition_recruit)
  end

  def update
    @talk_competition_recruit.update(talk_competition_recruit_params)
    respond_with(@talk_competition_recruit)
  end

  def destroy
    @talk_competition_recruit.destroy
    respond_with(@talk_competition_recruit)
  end

  private
    def set_talk_competition_recruit
      @talk_competition_recruit = TalkCompetition::Recruit.find(params[:id])
    end

    def talk_competition_recruit_params
      params[:talk_competition_recruit]
    end
end
