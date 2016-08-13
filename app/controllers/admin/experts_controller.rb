class Admin::ExpertsController < Admin::BaseController
	before_action :set_expert, only: [:show, :update, :edit, :new, :delete]

	def index
		@experts = Expert.all
	end

	def update
		if @expert.update(expert_params)
			redirect_to admin_experts_path
		else
			redirect_to admin_experts_path
		end
	end

	def delete
		@expert.destroy
		redirect_to admin_experts_path
	end

	private
	def expert_params
		params.require(:expert).permit(:name, :phone, :email, :last_sign_in_at, :last_sign_in_ip)
	end

	def set_expert
		@expert = Expert.find(params[:id])
	end
end
