class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]
  before_action :set_browser

  layout :phone_layout

  respond_to :html

  def show
    @activities = Activity.activate
    @activity = @activities.first
    redirect_to "/contest/center/activities/#{@activity.id}/#{@activity.route_type}/marks"
  end
end
