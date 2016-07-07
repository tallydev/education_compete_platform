class TalkCompetition::RecruitsController < ApplicationController
  before_action :authenticate_player!, only: [:new, :create]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_talk_competition_recruit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activity = TalkCompetition::Activity.find params[:activity_id]
    @talk_competition_recruits = @activity.school_recruits current_school_user.school
    respond_with(@talk_competition_recruits)
  end

  def show
    @player_info = @talk_competition_recruit.player.info
    respond_with(@talk_competition_recruit)
  end

  def new
    @first_recruit = current_player.recruits.blank? ? nil : current_player.recruits.first
    @player = current_player.try(:info)

    @talk_competition_activity = TalkCompetition::Activity.find(params[:activity_id])
    if @talk_competition_activity.recruit? current_player
      @talk_competition_recruit = @talk_competition_activity.player_recruit current_player
      redirect_to @talk_competition_recruit
    else
      @talk_competition_recruit = @talk_competition_activity.recruits.build
      respond_with(@talk_competition_recruit)
    end
  end

  def edit
  end

  def create
    @talk_competition_activity = TalkCompetition::Activity.find(params[:activity_id])
    @talk_competition_recruit = @talk_competition_activity.recruits.build(recruit_params)
    @talk_competition_recruit.player = Player.first
    @talk_competition_recruit.save

    @player_info = Player.first.info
    @player_info.school_id = recruit_params[:school_id] if recruit_params[:school_id].present?
    @player_info.update(player_params)
    @player_info.save

    p recruit_params
    p "-------------"
    p player_params

    respond_with(@talk_competition_recruit)
  end

  def update
    @talk_competition_recruit.update(recruit_params)
    respond_with(@talk_competition_recruit)
  end

  def destroy
    @talk_competition_recruit.destroy
    respond_with(@talk_competition_recruit)
  end

  private
    def set_talk_competition_recruit
      @talk_competition_recruit = TalkCompetition::Recruit.find(params[:id])
    end

    def recruit_params
      params.require(:talk_competition_recruit)
          .permit(:school_phone, :school_person, :school_id, :name, :comment, :work_time)
    end

    def player_params
      params[:talk_competition_recruit][:player_info].permit(:name, :card_number, :address,
        :code, :sex, :nation, :birth, :professional_title, :degree, :special, :email)
    end
end
