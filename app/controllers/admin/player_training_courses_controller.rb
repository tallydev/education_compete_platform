class Admin::PlayerTrainingCoursesController < ApplicationController
  acts_as_token_authentication_handler_for Admin 
  before_action :set_admin_player_training_course, only: [:show, :update]

  respond_to :json

  def index
    @keyword = params[:keyword].present?? params[:keyword] : " " #查询player(name,email,address)
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_player_training_courses = PlayerTrainingCourse.all.enabled.where({training_course_id: @training_course.id})
                                               .by_role(params[:role])
                                               .by_divide(params[:divide_id])
                                               .get_user_training_course(@training_course, params[:status])
                                               .keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@admin_player_training_courses)
  end

  def list
    @keyword = params[:keyword].present?? params[:keyword] : " " #查询player(name,email,address)
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_player_training_courses = PlayerTrainingCourse.enabled.keyword(@keyword).paginate(page: page, per_page: per_page)
    @role_count = PlayerTrainingCourse.role_count
    respond_with(@admin_player_training_courses)
  end

  def show##
    respond_with(@admin_player_training_course)
  end

  def update
    @admin_player_training_course.update(admin_player_training_course_params)
    respond_with(@admin_player_training_course)
  end

  # def destroy
  #   @admin_player_training_course.destroy
  #   respond_with(@admin_player_training_course)
  # end

  private
    def set_admin_player_training_course
      @admin_player_training_course = PlayerTrainingCourse.find(params[:id])
    end

    def admin_player_training_course_params
      params[:admin_player_training_course]
    end
end
