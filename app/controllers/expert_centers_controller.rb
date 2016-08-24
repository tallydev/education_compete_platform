class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]
  before_action :set_browser

  layout :phone_layout

  respond_to :html

  def show
    @activities = Activity.onlines
    @activity = InfoCompetition::Activity.first
    @recruits = current_expert.info_competition_recruits
    @recruits_online = @activities.first.recruits
    respond_with(@marks)
  end
end
