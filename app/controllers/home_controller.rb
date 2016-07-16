class HomeController < ApplicationController
  
  def index
    @notifications = Bulletin.all
    @activities = Activity.all

    @one_days = Activity.find(1).left_days
    @two_days = Activity.find(2).left_days
  end
end
