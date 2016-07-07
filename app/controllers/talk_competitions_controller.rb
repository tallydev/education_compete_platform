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
    @recruit = @activity.player_recruit current_player
    respond_with(@recruit)
  end

  private
    def set_activity
      @center_talk_competition = Center::TalkCompetition.find(params[:id])
    end
end
