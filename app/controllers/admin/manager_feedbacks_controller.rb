class Admin::ManagerFeedbacksController < ApplicationController
  acts_as_token_authentication_handler_for Admin
  before_action :set_admin_manager_feedback, only: [:show]

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_manager_feedbacks = ManagerFeedback.all.paginate(page: page, per_page: per_page)
    respond_with(@admin_manager_feedbacks)
  end

  def list
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_manager_feedbacks = ManagerFeedback.keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@admin_manager_feedbacks)
  end

  def show
    respond_with(@admin_manager_feedback)
  end

  private
    def set_admin_manager_feedback
      @admin_manager_feedback = Admin::ManagerFeedback.find(params[:id])
    end
end
