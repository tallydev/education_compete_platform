class Admin::MarksController < Admin::BaseController
	before_action :set_activity, only: [:index, :bind_new, :new, :create]
	respond_to :html, :js

	def index
		@recruits = @activity.project_recruits(params[:project]).avg_mark_desc
	end

	# 分配一个报名的评委专家
	def new
		@selected_recruits = [params[:recruit_id]]
		@distributed_experts = @activity.recruits.find(params[:recruit_id]).experts.pluck(:id)
    @experts = Expert.all
    respond_with @selected_recruits
	end

	# 分配多个报名的评委专家 || 分配比赛
	def bind_new
		@selected_recruits = params[:selected_recruits]
		@distributed_experts = []
    @experts = Expert.all

		if @selected_recruits.present?
			respond_with @selected_recruits
		else
			respond_to do |format|
				format.js { render js: "location.href = '/admin/activities/#{@activity.id}/#{@activity.route_type}'" }
			end
		end
	end

	# 给报名者（数组）分配评审专家
	def create
		# 要分配专家的报名人员
		if params[:recruit_experts]
			@activity_recruits = @activity.recruits.where(id: params[:selected_recruits])
			# 创建
			Mark.distribute_expert(@activity_recruits, params[:recruit_experts])
		else
			flash.now[:danger] = "请选择评委专家"
		end
		redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
	end

	private
		def set_activity
			@activity = Activity.find(params[:activity_id])
		end

end
