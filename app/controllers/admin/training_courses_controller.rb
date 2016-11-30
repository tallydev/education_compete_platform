class Admin::TrainingCoursesController < ApplicationController
  before_action :set_admin_training_course, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_training_courses = Admin::TrainingCourse.all
    respond_with(@admin_training_courses)
  end

  def show
    respond_with(@admin_training_course)
  end

  def new
    @admin_training_course = Admin::TrainingCourse.new
    respond_with(@admin_training_course)
  end

  def edit
  end

  def create
    @admin_training_course = Admin::TrainingCourse.new(admin_training_course_params)
    @admin_training_course.save
    respond_with(@admin_training_course)
  end

  def update
    @admin_training_course.update(admin_training_course_params)
    respond_with(@admin_training_course)
  end

  def destroy
    @admin_training_course.destroy
    respond_with(@admin_training_course)
  end

  private
    def set_admin_training_course
      @admin_training_course = Admin::TrainingCourse.find(params[:id])
    end

    def admin_training_course_params
      params[:admin_training_course]
    end
end
