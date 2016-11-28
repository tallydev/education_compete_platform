class Admin::PlayerFeedbacksController < ApplicationController
  before_action :set_admin_player_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_player_feedbacks = Admin::PlayerFeedback.all
    respond_with(@admin_player_feedbacks)
  end

  def show
    respond_with(@admin_player_feedback)
  end

  def new
    @admin_player_feedback = Admin::PlayerFeedback.new
    respond_with(@admin_player_feedback)
  end

  def edit
  end

  def create
    @admin_player_feedback = Admin::PlayerFeedback.new(admin_player_feedback_params)
    @admin_player_feedback.save
    respond_with(@admin_player_feedback)
  end

  def update
    @admin_player_feedback.update(admin_player_feedback_params)
    respond_with(@admin_player_feedback)
  end

  def destroy
    @admin_player_feedback.destroy
    respond_with(@admin_player_feedback)
  end

  private
    def set_admin_player_feedback
      @admin_player_feedback = Admin::PlayerFeedback.find(params[:id])
    end

    def admin_player_feedback_params
      params[:admin_player_feedback]
    end
end
