class TalkCompetitionsController < ApplicationController
  before_action :authenticate_player!, only: [:show]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_activity, only: [:show, :index, :marks]

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
    @marks = @activity.recruits.first.marks.where(expert_id: current_expert.id)
    respond_with(@marks)
  end

  def show
    @notifications = Bulletin.all
    @recruit = @activity.player_recruit current_player
    respond_with(@recruit)
  end

  private
    def set_activity
      if current_player
        @activities = current_player.activities
      else
        @activities = Activity.all
      end
      @activity = TalkCompetition::Activity.find(params[:activity_id])
    end
end
