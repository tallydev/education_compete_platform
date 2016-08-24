class HomeController < ApplicationController
  before_action :set_browser
  layout :login_layout
  def index
    @notifications = Bulletin.all
    @activities = Activity.onlines
    @recruits_online = @activities.first.recruits
    @one_days = Activity.find(1).left_days
    @two_days = Activity.find(2).left_days
  end
end
