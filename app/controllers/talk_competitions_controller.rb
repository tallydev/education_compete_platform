class TalkCompetitionsController < ApplicationController
  before_action :authenticate_player!, only: [:show]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_activity, only: [:show, :index]

  respond_to :html

  def index
    @recruits = @activity.school_recruits current_school_user.try(:school)
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
        @activities = current_player.activities
      else
        @activities = Activity.all
      end
      @activity = TalkCompetition::Activity.find(params[:activity_id])
    end
end
