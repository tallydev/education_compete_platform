module Admin
  class RecruitsController < BaseController
    before_action :set_activity
    respond_to :html, :js

    def index
      @recruits = @activity.recruits.paginate(:page => params[:page], :per_page => 20)
    end

    def distribution
      @recruit = @activity.recruits.find(params[:id])
      @experts = Expert.all
      respond_with @recruit
    end

    def save_distribution
      
    end

    private
      def set_activity
        @activity = Activity.find_by(id: params[:activity_id])
      end
  end
end
