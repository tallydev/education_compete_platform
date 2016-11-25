class PlayerFeedbacksController < ApplicationController
  before_action :set_player_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @player_feedbacks = PlayerFeedback.all
    respond_with(@player_feedbacks)
  end

  def show
    respond_with(@player_feedback)
  end

  def new
    @player_feedback = PlayerFeedback.new
    respond_with(@player_feedback)
  end

  def edit
  end

  def create
    @player_feedback = PlayerFeedback.new(player_feedback_params)
    @player_feedback.save
    respond_with(@player_feedback)
  end

  def update
    @player_feedback.update(player_feedback_params)
    respond_with(@player_feedback)
  end

  def destroy
    @player_feedback.destroy
    respond_with(@player_feedback)
  end

  private
    def set_player_feedback
      @player_feedback = PlayerFeedback.find(params[:id])
    end

    def player_feedback_params
      params[:player_feedback]
    end
end
