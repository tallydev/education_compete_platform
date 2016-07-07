class CenterController < ApplicationController
  
  def index
    @notifications = Bulletin.all
    @activities = Activity.all
  end

  def info_competition
    
  end

  def talk_competition
    
  end

  def personal_info
    
  end
end
