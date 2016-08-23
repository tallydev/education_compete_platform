class InfoCompetition::ActivitiesController < ApplicationController
  before_action :set_info_competition_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_activities = InfoCompetition::Activity.onlines
    respond_with(@info_competition_activities)
  end

  def show
    respond_with(@info_competition_activity)
  end

  def new
    @info_competition_activity = InfoCompetition::Activity.new
    respond_with(@info_competition_activity)
  end

  def edit
  end

  def create
    @info_competition_activity = InfoCompetition::Activity.new(info_competition_activity_params)
    @info_competition_activity.save
    respond_with(@info_competition_activity)
  end

  def update
    @info_competition_activity.update(info_competition_activity_params)
    respond_with(@info_competition_activity)
  end

  def destroy
    @info_competition_activity.destroy
    respond_with(@info_competition_activity)
  end

  private
    def set_info_competition_activity
      @info_competition_activity = InfoCompetition::Activity.find(params[:id])
    end

    def info_competition_activity_params
      params[:info_competition_activity]
    end
end
