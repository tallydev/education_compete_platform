class PlayerMessagesController < ApplicationController
  before_action :set_player_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @player_messages = PlayerMessage.all
    respond_with(@player_messages)
  end

  def show
    respond_with(@player_message)
  end

  def new
    @player_message = PlayerMessage.new
    respond_with(@player_message)
  end

  def edit
  end

  def create
    @player_message = PlayerMessage.new(player_message_params)
    @player_message.save
    respond_with(@player_message)
  end

  def update
    @player_message.update(player_message_params)
    respond_with(@player_message)
  end

  def destroy
    @player_message.destroy
    respond_with(@player_message)
  end

  private
    def set_player_message
      @player_message = PlayerMessage.find(params[:id])
    end

    def player_message_params
      params.require(:player_message).permit(:player_id, :message_id, :status)
    end
end
