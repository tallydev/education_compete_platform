class CentersController < ApplicationController
  before_action :authenticate_player!, only: [:show]

  respond_to :html

  def show
    @activities = current_player.activities
  end
end
