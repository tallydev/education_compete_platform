class Center::InfoCompetitionsController < ApplicationController
  before_action :set_center_info_competition, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @center_info_competitions = Center::InfoCompetition.all
    respond_with(@center_info_competitions)
  end

  def show
    respond_with(@center_info_competition)
  end

  def new
    @center_info_competition = Center::InfoCompetition.new
    respond_with(@center_info_competition)
  end

  def edit
  end

  def create
    @center_info_competition = Center::InfoCompetition.new(center_info_competition_params)
    @center_info_competition.save
    respond_with(@center_info_competition)
  end

  def update
    @center_info_competition.update(center_info_competition_params)
    respond_with(@center_info_competition)
  end

  def destroy
    @center_info_competition.destroy
    respond_with(@center_info_competition)
  end

  private
    def set_center_info_competition
      @center_info_competition = Center::InfoCompetition.find(params[:id])
    end

    def center_info_competition_params
      params[:center_info_competition]
    end
end
