class ManagerFeedbacksController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_training_course
  before_action :set_player_feedback, only: [:create, :update]

  before_action :set_manager_feedback, only: [:show]

  respond_to :html, :json

  def index #####
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @manager_feedbacks = ManagerFeedback.all.paginate(page: page, per_page: per_page)
    respond_with(@manager_feedbacks)
  end

  def show####
    respond_with(@manager_feedback)
  end

  def create
    if @manager_feedback.blank?
      @manager_feedback = @training_course.build_manager_feedback
      @manager_feedback.save
      respond_with(@manager_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  def update
    if @manager_feedback.update(manager_feedback_params)
      respond_with(@manager_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  # def destroy
  #   @manager_feedback.destroy
  #   respond_with(@manager_feedback)
  # end

  private
    def set_manager_feedback
      @manager_feedback = ManagerFeedback.find(params[:id])
    end

    def set_training_course
      @training_course = TrainingCourse.find(params[:training_course_id])
    end

    def set_manager_feedback
      @manager_feedback = @training_course.manager_feedback
    end

    def manager_feedback_params
      params.require(:manager_feedback).permit(:training_course_id, :admin_id, :organizer, :total_hours, :total_expenses,
                                     :total_expenses_info, :feedback, :remark)
    end
end
