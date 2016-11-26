class TrainingCoursesController < ApplicationController
  before_action :set_training_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @training_courses = TrainingCourse.all
    respond_with(@training_courses)
  end

  def show
    respond_with(@training_course)
  end

  def new
    @training_course = TrainingCourse.new
    respond_with(@training_course)
  end

  def edit
  end

  def create
    @training_course = TrainingCourse.new(training_course_params)
    @training_course.save
    respond_with(@training_course)
  end

  def update
    @training_course.update(training_course_params)
    respond_with(@training_course)
  end

  def destroy
    @training_course.destroy
    respond_with(@training_course)
  end

  private
    def set_training_course
      @training_course = TrainingCourse.find(params[:id])
    end

    def training_course_params
      params[:training_course]
    end
end
