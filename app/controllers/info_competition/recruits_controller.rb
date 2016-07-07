class InfoCompetition::RecruitsController < ApplicationController
  before_action :authenticate_player!, only: [:new, :create]
  before_action :set_info_competition_recruit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_recruits = InfoCompetition::Recruit.all
    respond_with(@info_competition_recruits)
  end

  def show
    @player_info = @info_competition_recruit.player.info
    respond_with(@info_competition_recruit)
  end

  def new
    @info_competition_activity = InfoCompetition::Activity.find(params[:activity_id])
    if @info_competition_activity.recruit? current_player
      @info_competition_recruit = @info_competition_activity.player_recruit current_player
      redirect_to @info_competition_recruit
    else
      @info_competition_recruit = @info_competition_activity.recruits.build
      respond_with(@info_competition_recruit)
    end
  end

  def edit
  end

  def create
    @info_competition_activity = InfoCompetition::Activity.find(params[:activity_id])
    @info_competition_recruit = @info_competition_activity.recruits.build(recruit_params)
    @info_competition_recruit.player = Player.first
    @info_competition_recruit.save

    @player_info = Player.first.info
    @player_info.school_id = recruit_params[:school_id] if recruit_params[:school_id].present?
    @player_info.update(player_params)
    @player_info.save
    
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

    def recruit_params
      params.require(:info_competition_recruit)
          .permit(:school_phone, :school_person, :school_id, :project, :name, :version,
            :comment, :cooperater_1, :cooperater_2, :cooperater_3, :school_1, :school_2,
            :school_3, :course_1, :course_2, :course_3)
    end

    def player_params
      params[:info_competition_recruit][:player_info].permit(:name, :card_number, :address,
        :code, :sex, :nation, :birth, :professional_title, :degree, :special, :email)
    end
end
