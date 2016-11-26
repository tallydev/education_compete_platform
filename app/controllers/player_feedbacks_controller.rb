class PlayerFeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_training_course
  before_action :set_player_feedback

  before_action :set_player_feedback, only: [:show]

  respond_to :html, :json

  def index###
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @player_feedbacks = PlayerFeedback.all.paginate(page: page, per_page: per_page)
    respond_with(@player_feedbacks)
  end

  def show###
    respond_with(@player_feedback)
  end

  def create
    if @player_feedback.blank?
      @player_feedback = @training_course.player_feedbacks.new
      @player_feedback.user_id = current_user.id
      @player_feedback.save
      respond_with(@player_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  def update
    if @player_feedback.update(player_feedback_params.merge(user_id: current_user.id))
      respond_with(@player_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  # def destroy
  #   @player_feedback.destroy
  #   respond_with(@player_feedback)
  # end

  private
    def set_player_feedback
      @player_feedback = PlayerFeedback.find(params[:id])
    end

    def set_training_course
      @training_course = TrainingCourse.find(params[:training_course_id])
    end

    def set_player_feedback
      @player_feedback = PlayerFeedback.where(training_course_id: @training_course.id, user_id: current_user.id).first
    end

    def player_feedback_params
      params.require(:player_feedback).permit(:user_id, :training_course_id, :teach, :discussion, :visiting, :organization,
                                             :study_life, :most_value, :most_gain, :graduate_message)
    end
end
