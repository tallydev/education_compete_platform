class InfoCompetition::OpusesController < ApplicationController
  before_action :set_info_competition_opus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_opuses = InfoCompetition::Opus.all
    respond_with(@info_competition_opuses)
  end

  def show
    respond_with(@info_competition_opus)
  end

  def new
    @info_competition_opus = InfoCompetition::Opus.new
    respond_with(@info_competition_opus)
  end

  def edit
  end

  def create
    @info_competition_opus = InfoCompetition::Opus.new(info_competition_opus_params)
    @info_competition_opus.save
    respond_with(@info_competition_opus)
  end

  def update
    @info_competition_opus.update(info_competition_opus_params)
    respond_with(@info_competition_opus)
  end

  def destroy
    @info_competition_opus.destroy
    respond_with(@info_competition_opus)
  end

  private
    def set_info_competition_opus
      @info_competition_opus = InfoCompetition::Opus.find(params[:id])
    end

    def info_competition_opus_params
      params[:info_competition_opus]
    end
end
