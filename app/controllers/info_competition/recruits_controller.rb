class InfoCompetition::RecruitsController < ApplicationController
  before_action :set_info_competition_recruit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_recruits = InfoCompetition::Recruit.all
    respond_with(@info_competition_recruits)
  end

  def show
    respond_with(@info_competition_recruit)
  end

  def new
    @info_competition_recruit = InfoCompetition::Recruit.new
    respond_with(@info_competition_recruit)
  end

  def edit
  end

  def create
    @info_competition_recruit = InfoCompetition::Recruit.new(info_competition_recruit_params)
    @info_competition_recruit.save
    respond_with(@info_competition_recruit)
  end

  def update
    @info_competition_recruit.update(info_competition_recruit_params)
    respond_with(@info_competition_recruit)
  end

  def destroy
    @info_competition_recruit.destroy
    respond_with(@info_competition_recruit)
  end

  private
    def set_info_competition_recruit
      @info_competition_recruit = InfoCompetition::Recruit.find(params[:id])
    end

    def info_competition_recruit_params
      params[:info_competition_recruit]
    end
end
