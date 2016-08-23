class SchoolCentersController < ApplicationController
  before_action :authenticate_school_user!, only: [:index]

  respond_to :html

  def show
    @activities = Activity.onlines
  end
  
end
