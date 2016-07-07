class InfoCompetition::RecruitsController < ApplicationController
  before_action :authenticate_player!, only: [:new, :create]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_info_competition_recruit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activity = InfoCompetition::Activity.find params[:activity_id]
    @info_competition_recruits = @activity.school_recruits current_school_user.school
    respond_with(@info_competition_recruits)
  end

  def show
    @player_info = @info_competition_recruit.player.info
    respond_with(@info_competition_recruit)
  end

  def new
    @first_recruit = current_player.recruits.blank? ? nil : current_player.recruits.first
    @player = current_player.try(:info)

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
    @info_competition_recruit.player = current_player
    puts "school_id is:#{recruit_params[:school_id]}"
    @info_competition_recruit.save

    @player_info = current_player.info
    @player_info.school_id = recruit_params[:school_id] if recruit_params[:school_id].present?
    @player_info.update(player_params)
    @player_info.save

    p recruit_params
    p "-------------"
    p player_params
    
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
