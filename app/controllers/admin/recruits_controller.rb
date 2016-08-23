module Admin
  class RecruitsController < BaseController
    before_action :set_activity

    def index
      @recruits = @activity.recruits.paginate(:page => params[:page], :per_page => 20)
    end

    # 分配比赛
    def assgin_activity
      @recruit = @activity.recruits.find(params[:recruit_id])
      @recruit.assgin_to_new_activity @activity
      redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
    end

    private
      def set_activity
        @activity = Activity.find_by(id: params[:activity_id])
      end
  end
end
