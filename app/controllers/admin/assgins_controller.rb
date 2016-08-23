# 分配比赛
class Admin::AssginsController < Admin::BaseController
	respond_to :html, :js

	def new
		@activity = Activity.find(params[:activity_id])
		@recruit = @activity.recruits.find(params[:recruit_id])
		@activities = Activity.where("type = ? AND id != ?", @activity.type, @activity.id);
		respond_with @recruit
	end

	def create
		# 找到选手报名
		_activity = Activity.find(params[:activity_id])
		_recruit = _activity.recruits.find(params[:recruit_id])
		# 分配的比赛
		_assgin_new_activity = Activity.find(params[:assgin_activity_id])
		# 开始分配
		_recruit.assgin_to_new_activity _assgin_new_activity

		redirect_to "/admin/activities/#{_activity.id}/#{_activity.route_type}"
	end
end