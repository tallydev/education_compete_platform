class Admin::TrainingCoursesController < ApplicationController
  acts_as_token_authentication_handler_for Admin
  before_action :set_admin_training_course, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_training_courses = TrainingCourse.all.keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@admin_training_courses)
  end

  def create
    @admin_training_course = TrainingCourse.new(admin_training_course_params)
    if @admin_training_course.save
      respond_with(@admin_training_course) 
    else
      @error = "培训项目信息创建 失败 ！"
      respond_with(@error)
    end
  end

  def show
    respond_with(@admin_training_course)
  end

  def update
    @admin_training_course.update(admin_training_course_params)
    respond_with(@admin_training_course)
  end

  ################### 培训项目的审核 ###########################
  #取消审核状态
  def unchecked
    @admin_training_course.to_unchecked!
    respond_with(@admin_training_course, template:"admin/training_courses/show", status: 201)
  end

  #专家审核状态
  def checked_by_expert
    @admin_training_course.to_checked_by_expert!
    respond_with(@admin_training_course, template:"admin/training_courses/show", status: 201)
  end

  #研究会审核状态
  def checked_by_seminar
    @admin_training_course.to_checked_by_seminar!
    respond_with(@admin_training_course, template:"admin/training_courses/show", status: 201)
  end

  #教委审核状态
  def checked_by_educator
    @admin_training_course.to_checked_by_educator!
    respond_with(@admin_training_course, template:"admin/training_courses/show", status: 201)
  end  


  # def destroy
  #   @admin_training_course.destroy
  #   respond_with(@admin_training_course)
  # end

  private
    def set_admin_training_course
      @admin_training_course = TrainingCourse.find(params[:id])
    end

    def admin_training_course_params
      params.require(:training_course).permit(:journal_number, :task_end_time, :email, :phone, :linkman, :fax, :mobile,
                             :admin_id, :start_apply_time, :end_apply_time, :notification_id, :school_id, :name, :code, :start_time, :end_time,
                             :plan_number, :training_agency, :training_address, :training_fee,
                             :state, :remark, :info, :training_background, :training_target, :be_applied,
                             :training_content, :check_method, :project_leader, :grade_leader, :contact, :category, {teacher_ids: []},
                             divides_attributes: [:id, :name, :header, :_destroy])
    end
end
