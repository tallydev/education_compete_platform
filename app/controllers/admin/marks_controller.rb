class Admin::MarksController < Admin::BaseController
	before_action :set_activity, only: [:index, :bind_new, :new, :create]
	respond_to :html, :js

	def index
		@recruits = @activity.recruits
	end

	# 分配一个报名的评委专家
	def new
		@selected_recruits = []
		@selected_recruits.push params[:recruit_id]
    @experts = Expert.all
    respond_with @selected_recruits
	end

	# 分配多个报名的评委专家
	def bind_new
		@selected_recruits = params[:selected_recruits]
    @experts = Expert.all
    respond_with @selected_recruits
	end

	# 给报名者（数组）分配评审专家
	def create
		# 要分配专家的报名人员
		@activity_recruits = @activity.recruits.where(id: params[:selected_recruits])
		# 创建
		Mark.distribute_expert(@activity_recruits, params[:recruit_experts])
		redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
	end

	private
		def set_activity
			@activity = Activity.find(params[:activity_id])
		end

end
