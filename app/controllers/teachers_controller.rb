class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @teachers = Teacher.all.paginate(page: page, per_page: per_page)
    respond_with(@teachers)
  end

  def show
    respond_with(@teacher)
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      respond_with(@teacher) 
    else
      @error = "老师信息创建 失败 ！"
      respond_with(@error, template: "error")
    end
  end

  def update
    @teacher.update(teacher_params)
    respond_with(@teacher, template:"teachers/show", status: 201)
  end

  def destroy
    @teacher.destroy
    respond_with(@teacher)
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :postcode, :mobile, :id_card, :position,
       :sex, :remark, :phone, :address, :school_id, :job_title, :qq)
    end
end
