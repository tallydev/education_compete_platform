class TrainingCourseTeachersController < ApplicationController
  before_action :set_training_course_teacher, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @training_course_teachers = TrainingCourseTeacher.all
    respond_with(@training_course_teachers)
  end

  def show
    respond_with(@training_course_teacher)
  end

  def new
    @training_course_teacher = TrainingCourseTeacher.new
    respond_with(@training_course_teacher)
  end

  def edit
  end

  def create
    @training_course_teacher = TrainingCourseTeacher.new(training_course_teacher_params)
    @training_course_teacher.save
    respond_with(@training_course_teacher)
  end

  def update
    @training_course_teacher.update(training_course_teacher_params)
    respond_with(@training_course_teacher)
  end

  def destroy
    @training_course_teacher.destroy
    respond_with(@training_course_teacher)
  end

  private
    def set_training_course_teacher
      @training_course_teacher = TrainingCourseTeacher.find(params[:id])
    end

    def training_course_teacher_params
      params[:training_course_teacher]
    end
end
