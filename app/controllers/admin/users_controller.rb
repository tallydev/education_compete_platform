module Admin
  class UsersController < BaseController
    
    def index
      @users = User.where(type: 'player').paginate(:page => params[:page], :per_page => 20)
    end

    private
    
  end
end
