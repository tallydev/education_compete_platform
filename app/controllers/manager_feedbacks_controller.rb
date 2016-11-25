class ManagerFeedbacksController < ApplicationController
  before_action :set_manager_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @manager_feedbacks = ManagerFeedback.all
    respond_with(@manager_feedbacks)
  end

  def show
    respond_with(@manager_feedback)
  end

  def new
    @manager_feedback = ManagerFeedback.new
    respond_with(@manager_feedback)
  end

  def edit
  end

  def create
    @manager_feedback = ManagerFeedback.new(manager_feedback_params)
    @manager_feedback.save
    respond_with(@manager_feedback)
  end

  def update
    @manager_feedback.update(manager_feedback_params)
    respond_with(@manager_feedback)
  end

  def destroy
    @manager_feedback.destroy
    respond_with(@manager_feedback)
  end

  private
    def set_manager_feedback
      @manager_feedback = ManagerFeedback.find(params[:id])
    end

    def manager_feedback_params
      params[:manager_feedback]
    end
end
