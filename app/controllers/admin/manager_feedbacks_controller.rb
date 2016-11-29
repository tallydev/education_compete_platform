class Admin::ManagerFeedbacksController < ApplicationController
  before_action :set_admin_manager_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_manager_feedbacks = Admin::ManagerFeedback.all
    respond_with(@admin_manager_feedbacks)
  end

  def show
    respond_with(@admin_manager_feedback)
  end

  def new
    @admin_manager_feedback = Admin::ManagerFeedback.new
    respond_with(@admin_manager_feedback)
  end

  def edit
  end

  def create
    @admin_manager_feedback = Admin::ManagerFeedback.new(admin_manager_feedback_params)
    @admin_manager_feedback.save
    respond_with(@admin_manager_feedback)
  end

  def update
    @admin_manager_feedback.update(admin_manager_feedback_params)
    respond_with(@admin_manager_feedback)
  end

  def destroy
    @admin_manager_feedback.destroy
    respond_with(@admin_manager_feedback)
  end

  private
    def set_admin_manager_feedback
      @admin_manager_feedback = Admin::ManagerFeedback.find(params[:id])
    end

    def admin_manager_feedback_params
      params[:admin_manager_feedback]
    end
end
