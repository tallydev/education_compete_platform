class Admin::TeachersController < ApplicationController
  acts_as_token_authentication_handler_for Admin
  before_action :set_admin_teacher, only: [:show, :update, :destroy]

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_teachers = Teacher.all.paginate(page: page, per_page: per_page)
    respond_with(@admin_teachers)
  end

  def show
    respond_with(@admin_teacher)
  end

  def create
    @admin_teacher = Teacher.new(admin_teacher_params)
    if @admin_teacher.save
      respond_with(@admin_teacher) 
    else
      @error = "老师信息创建 失败 ！"
      respond_with(@error)
    end
  end

  def update
    @admin_teacher.update(admin_teacher_params)
    respond_with(@admin_teacher)
  end

  def destroy
    @admin_teacher.destroy
    respond_with(@admin_teacher)
  end

  private
    def set_admin_teacher
      @admin_teacher = Teacher.find(params[:id])
    end

    def admin_teacher_params
      params.require(:teacher).permit(:name, :email, :postcode, :mobile, :id_card, :position,
       :sex, :remark, :phone, :address, :school_id, :job_title, :qq)
    end
end
