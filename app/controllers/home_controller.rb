class HomeController < ApplicationController
  
  def index
    @notifications = Bulletin.all
    @activities = Activity.all
  end
end
