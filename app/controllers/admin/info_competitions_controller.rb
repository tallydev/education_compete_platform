module Admin
  class InfoCompetitionsController < BaseController
    before_action :set_activity

    def index
      @recruits = @activity.recruits
    end

    def print
      @recruits = @activity.recruits
    end
    
    private
    def set_activity
      @activity = Activity.find_by(id: params[:activity_id])
    end
  end
end
