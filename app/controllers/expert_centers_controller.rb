class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]

  respond_to :html

  def show
    @activities = Activity.all
    @activity = InfoCompetition::Activity.first
    @marks = @activity.recruits.first.marks.where(expert_id: current_expert.id)
    respond_with(@marks)
  end
  
end
