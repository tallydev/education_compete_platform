class PlayerTrainingCoursesController < ApplicationController
  before_action :set_player_training_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @player_training_courses = PlayerTrainingCourse.all
    respond_with(@player_training_courses)
  end

  def show
    respond_with(@player_training_course)
  end

  def new
    @player_training_course = PlayerTrainingCourse.new
    respond_with(@player_training_course)
  end

  def edit
  end

  def create
    @player_training_course = PlayerTrainingCourse.new(player_training_course_params)
    @player_training_course.save
    respond_with(@player_training_course)
  end

  def update
    @player_training_course.update(player_training_course_params)
    respond_with(@player_training_course)
  end

  def destroy
    @player_training_course.destroy
    respond_with(@player_training_course)
  end

  private
    def set_player_training_course
      @player_training_course = PlayerTrainingCourse.find(params[:id])
    end

    def player_training_course_params
      params[:player_training_course]
    end
end
