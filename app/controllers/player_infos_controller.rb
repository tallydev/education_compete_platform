class PlayerInfosController < ApplicationController
  before_action :set_player_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @player_infos = PlayerInfo.all
    respond_with(@player_infos)
  end

  def show
    respond_with(@player_info)
  end

  def new
    @player_info = PlayerInfo.new
    respond_with(@player_info)
  end

  def edit
  end

  def create
    @player_info = PlayerInfo.new(player_info_params)
    @player_info.save
    respond_with(@player_info)
  end

  def update
    @player_info.update(player_info_params)
    respond_with(@player_info)
  end

  def destroy
    @player_info.destroy
    respond_with(@player_info)
  end

  private
    def set_player_info
      @player_info = PlayerInfo.find(params[:id])
    end

    def player_info_params
      params[:player_info]
    end
end
