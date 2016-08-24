class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]
  before_action :set_browser

  layout :login_layout

  respond_to :html

  def show
    @activities = Activity.onlines
    @activity = InfoCompetition::Activity.first
    @recruits = current_expert.info_competition_recruits
    @recruits_online = @activities.first.recruits
    respond_with(@marks)
  end

  private

    def set_browser
      user_agent = request.env['HTTP_USER_AGENT'].downcase 
      if user_agent.include?("iphone") || user_agent.include?("android")
        @browser = :phone
        @layout = "phone"
      else
        @browser = :computer
        @layout = "application"
      end
    end

    def login_layout
      @layout
    end  
end
