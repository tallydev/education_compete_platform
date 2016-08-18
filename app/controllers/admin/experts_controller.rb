class Admin::ExpertsController < Admin::BaseController
	before_action :set_expert, only: [:show, :update, :edit, :destroy]
	respond_to :html, :js

	def index
		@experts = Expert.all
	end

	def new
		@expert = Expert.new
		respond_with @expert
	end

	def create
		@expert = Expert.new(expert_params)
		if @expert.save
			# @expert.create_user_info(name: expert_params[:name])
			flash[:success] = "新增专家成功"
			respond_to do |format|
				format.js { render js: "location.href = '#{admin_experts_path}'" }
			end
		else
			flash[:danger] = "新增专家失败"
			render :new
		end
	end

	def edit
		# @expert.name = @expert.try(:user_info).try(:name)
		respond_with @expert
	end

	def update
		if @expert.update(expert_params)
			# @expert.user_info.update(name: expert_params[:name])
			flash[:success] = "修改专家信息成功"
			respond_to do |format|
				format.js { render js: "location.href = '#{admin_experts_path}'" }
			end
		else
			flash[:danger] = "修改专家信息失败"
		render :edit
		end
	end

	def destroy
		@expert.destroy
		redirect_to admin_experts_path
	end

	private
	def expert_params
		params.require(:expert).permit(:phone, :email, :password)
	end

	def set_expert
		@expert = Expert.find(params[:id])
	end
end
