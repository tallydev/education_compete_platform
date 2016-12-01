class PlayerTrainingCoursesController < ApplicationController
  acts_as_token_authentication_handler_for Player 
  before_action :set_player_training_course, only: [:show]

  respond_to :json

  def index
    @player_training_courses = PlayerTrainingCourse.all
    respond_with(@player_training_courses)
  end

  def show
    respond_with(@player_training_course)
  end

  def create
    @player_training_course = PlayerTrainingCourse.new(player_training_course_params)
    if @player_training_course.save
      respond_with(@player_training_course) 
    else
      @error = "学员报名失败 ！"
      respond_with(@error)
    end
  end

  private
    def set_player_training_course
      @player_training_course = PlayerTrainingCourse.find(params[:id])
    end

    def player_training_course_params
      params.require(:player_training_course).permit(:player_id, :training_course_id, :remark, :certificate_no)
    end
end
