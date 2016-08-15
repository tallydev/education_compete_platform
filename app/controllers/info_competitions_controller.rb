class InfoCompetitionsController < ApplicationController
  before_action :authenticate_player!, only: [:show]
  before_action :authenticate_school_user!, only: [:index]
  before_action :set_activity, only: [:show, :index]

  respond_to :html

  # 给学校管理员查看所有本学校报名的列表
  def index
    if current_school_user.phone == "信息化教学指导委员会"
      @recruits = @activity.recruits
    else
      @recruits = @activity.school_recruits current_school_user.try(:school)
    end
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
      @activity = InfoCompetition::Activity.find(params[:activity_id])
    end
end
