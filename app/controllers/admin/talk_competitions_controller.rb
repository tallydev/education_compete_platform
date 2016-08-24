module Admin
  class TalkCompetitionsController < BaseController
    before_action :set_activity
    respond_to :html, :js

    def index
      @recruits = @activity.recruits.position_asc
    end

    def edit
      @recruit = @activity.recruits.find(params[:id])
      respond_with @activity
    end

    # 更新Recruit的position
    def update
      @recruit = @activity.recruits.find(params[:id])
      if @recruit.update(position: params[:position])
        flash.now[:success] = "设置成功"
        redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
      else
        flash.now[:success] = "设置失败"
        redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
      end
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
