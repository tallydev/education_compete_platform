class AppraisesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_training_course
  before_action :set_teachers

  before_action :set_appraise, only: [:show]

  respond_to :json

  def index####
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @appraises = Appraise.all.paginate(page: page, per_page: per_page)
    respond_with(@appraises)
  end

  def list
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @appraises = Appraise.all.where(training_course_id: @training_course.id, user_id: current_user.id).paginate(page: page, per_page: per_page)
    respond_with(@appraises)
  end

  def show###
    respond_with(@appraise)
  end

  def create
    @teacher_ids.each_with_index do |teacher, index|
      p = 'appraise_' + index.to_s
      @appraise = Appraise.new
      @appraise.user_id = current_user.id
      @appraise.teacher_id = teacher.id
      @appraise.training_course_id = @training_course.id
      @appraise.degree = params[p.to_sym][:degree]
      @appraise.remark = params[p.to_sym][:remark]
      @appraise.save
      respond_with(@appraise)
    end 
  end

  # def update
  #   @appraise.update(appraise_params)
  #   respond_with(@appraise)
  # end

  # def destroy
  #   @appraise.destroy
  #   respond_with(@appraise)
  # end

  private
    def set_appraise
      @appraise = Appraise.find(params[:id])
    end

    def set_training_course
      @training_course = TrainingCourse.find(params[:training_course_id])
    end

    def set_teachers
      @teacher_ids = Teacher.where({id: @training_course.training_course_teachers.pluck(:teacher_id)})
    end
end
