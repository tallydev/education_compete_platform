class PlayerFeedbacksController < ApplicationController
  acts_as_token_authentication_handler_for Player 
  before_action :set_player_feedback, only: [:show, :update]

  respond_to :json

  def index###
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @player_feedbacks = PlayerFeedback.all.paginate(page: page, per_page: per_page)
    respond_with(@player_feedbacks)
  end

  def show###
    respond_with(@player_feedback)
  end

  def create
    @player_feedback = PlayerFeedback.new(player_feedback_params)
    if @player_feedback.save
      respond_with(@player_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  def update
    if player_feedback_params.present?
      @player_feedback.update(player_feedback_params)
      respond_with(@player_feedback)
    else
      @error = "反馈信息创建失败"
      respond_with @error, template: "error"
    end
  end

  # def destroy
  #   @player_feedback.destroy
  #   respond_with(@player_feedback)
  # end

  private
    def set_player_feedback
      @player_feedback = PlayerFeedback.find(params[:id])
    end

    def player_feedback_params
      params.require(:player_feedback).permit(
        :player_id, :training_course_id, :teach, 
        :discussion, :visiting, :organization,:study_life,
        :most_value, :most_gain, :graduate_message
        )
    end
end
