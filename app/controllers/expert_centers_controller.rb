class ExpertCentersController < ApplicationController
  before_action :authenticate_expert!, only: [:index]

  respond_to :html

  def show
    @activities = Activity.all
  end
  
end
