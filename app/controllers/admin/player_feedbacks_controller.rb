class Admin::PlayerFeedbacksController < ApplicationController
  acts_as_token_authentication_handler_for Admin
  before_action :set_admin_player_feedback, only: [:show]

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_player_feedbacks = PlayerFeedback.all.paginate(page: page, per_page: per_page)
    respond_with(@admin_player_feedbacks)
  end

  def show
    respond_with(@admin_player_feedback)
  end

  # def update
  #   @admin_player_feedback.update(admin_player_feedback_params)
  #   respond_with(@admin_player_feedback)
  # end

  # def destroy
  #   @admin_player_feedback.destroy
  #   respond_with(@admin_player_feedback)
  # end

  private
    def set_admin_player_feedback
      @admin_player_feedback = PlayerFeedback.find(params[:id])
    end
end
