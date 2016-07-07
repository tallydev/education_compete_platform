class CentersController < ApplicationControllers
  before_action :authenticate_player!, only: [:show]

  respond_to :html

  def show
    
  end
end
