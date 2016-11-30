class TrainingCoursesController < ApplicationController
  before_action :set_training_course, only: [:show, :print]

  respond_to :json

  def index
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @training_courses = TrainingCourse.all.keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@training_courses)
  end

  def list
    @category = params[:category].present?? params[:category] : "country"
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @training_courses = TrainingCourse.all.scope_category(@category).keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@training_courses)
  end

  def show
    respond_with(@training_course)
  end

  def print
    
  end

  private
    def set_training_course
      @training_course = TrainingCourse.find(params[:id])
    end
end
