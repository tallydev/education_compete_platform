module Admin
  class InfoCompetitionsController < BaseController
    before_action :set_activity

    def index
      @recruits = @activity.recruits.paginate(:page => params[:page], :per_page => 20)
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