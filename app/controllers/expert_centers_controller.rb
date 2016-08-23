class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]

  respond_to :html

  def show
    @activities = Activity.onlines
    @activity = InfoCompetition::Activity.first
    @recruits = current_expert.info_competition_recruits
    respond_with(@marks)
  end
  
end
