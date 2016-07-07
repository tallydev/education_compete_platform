class Center::TalkCompetitionsController < ApplicationController
  before_action :set_center_talk_competition, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @center_talk_competitions = Center::TalkCompetition.all
    respond_with(@center_talk_competitions)
  end

  def show
    respond_with(@center_talk_competition)
  end

  def new
    @center_talk_competition = Center::TalkCompetition.new
    respond_with(@center_talk_competition)
  end

  def edit
  end

  def create
    @center_talk_competition = Center::TalkCompetition.new(center_talk_competition_params)
    @center_talk_competition.save
    respond_with(@center_talk_competition)
  end

  def update
    @center_talk_competition.update(center_talk_competition_params)
    respond_with(@center_talk_competition)
  end

  def destroy
    @center_talk_competition.destroy
    respond_with(@center_talk_competition)
  end

  private
    def set_center_talk_competition
      @center_talk_competition = Center::TalkCompetition.find(params[:id])
    end

    def center_talk_competition_params
      params[:center_talk_competition]
    end
end
