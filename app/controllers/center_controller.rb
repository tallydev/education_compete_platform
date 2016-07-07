class CenterController < ApplicationController
  before_action :set_center_datas
  
  def index

  end

  def info_competition
    if current_player.present?
      
    end
  end

  def talk_competition
    
  end

  def personal_info
    
  end

  private
    def set_center_datas
      @notifications = Bulletin.all
      @activities = Activity.all
      if current_player.present?
        @join_activities = current_player.activities
      end
    end
end
