class Admin::MarksController < Admin::BaseController
	def index
	end

	def create
		@activity = Activity.find(params[:activity_id])
		@recruit = @activity.recruits.find(params[:])

		if params[:recruit_experts].blank?
			redirect_to admin_activity_recruits_path(activity_id: params[:activity_id])
		else
			params[:recruit_experts].each do |id|

			end
		end
		
	end

end
