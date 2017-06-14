class SchoolCentersController < ApplicationController
  before_action :authenticate_school_user!, only: [:index]

  respond_to :html

  def show
    @activities = Activity.onlines
    redirect_to "/contest/center/activities/#{@activities.first.id}/#{@activities.first.route_type}"
  end

end
