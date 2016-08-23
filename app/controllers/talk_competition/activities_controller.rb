class TalkCompetition::ActivitiesController < ApplicationController
  before_action :set_talk_competition_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @talk_competition_activities = TalkCompetition::Activity.onlines
    respond_with(@talk_competition_activities)
  end

  def show
    respond_with(@talk_competition_activity)
  end

  def new
    @talk_competition_activity = TalkCompetition::Activity.new
    respond_with(@talk_competition_activity)
  end

  def edit
  end

  def create
    @talk_competition_activity = TalkCompetition::Activity.new(talk_competition_activity_params)
    @talk_competition_activity.save
    respond_with(@talk_competition_activity)
  end

  def update
    @talk_competition_activity.update(talk_competition_activity_params)
    respond_with(@talk_competition_activity)
  end

  def destroy
    @talk_competition_activity.destroy
    respond_with(@talk_competition_activity)
  end

  private
    def set_talk_competition_activity
      @talk_competition_activity = TalkCompetition::Activity.find(params[:id])
    end

    def talk_competition_activity_params
      params[:talk_competition_activity]
    end
end
