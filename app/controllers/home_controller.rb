class HomeController < ApplicationController
  
  def index
    @notifications = Bulletin.all
    @activities = Activity.all

    @activity_one = Activity.find(1).left_days
    @activity_two = Activity.find(2).left_days
  end
end
