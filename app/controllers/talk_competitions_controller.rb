class TalkCompetitionsController < ApplicationController
  before_action :authenticate_player!, only: [:show]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_activity, only: [:show, :index, :marks]
  before_action :authenticate_expert!, only: [:marks]

  respond_to :html

  def index
    if current_school_user.phone == "信息化教学指导委员会"
      @recruits = @activity.recruits
    else
      @recruits = @activity.school_recruits current_school_user.try(:school)
    end
    respond_with(@recruits)
  end

  def marks
    @recruits = current_expert.talk_competition_recruits.activity_filter(@activity)
    respond_with(@recruits)
  end

  def show
    @notifications = Bulletin.all
    @recruit = @activity.player_recruit current_player
    respond_with(@recruit)
  end

  private
    def set_activity
      if current_player
        @activities = current_player.activities.select { |activity| activity.status == 'activate' }
      else
        @activities = Activity.activate
      end
      @activity = TalkCompetition::Activity.find(params[:activity_id])
    end
end
