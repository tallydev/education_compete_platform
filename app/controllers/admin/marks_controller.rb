class Admin::MarksController < Admin::BaseController

	respond_to :html, :js

	def index
	end

	# 分配专家
	def new
		@activity = Activity.find(params[:activity_id])
	  @recruit = @activity.recruits.find(params[:recruit_id])
    @experts = Expert.all
    respond_with @recruit
	end

	# 给单个报名者分配评审专家
	def create
		@activity = Activity.find(params[:activity_id])
		@recruit = @activity.recruits.find(params[:recruit_id])

		unless params[:recruit_experts].blank?
			Mark.distribute_expert(@recruit, params[:recruit_experts])
		end

		redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
	end

end
