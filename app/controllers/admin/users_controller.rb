module Admin
  class UsersController < BaseController
    
    def index
      @users = Player.all.paginate(:page => params[:page], :per_page => 20)
    end

    def destroy
      
    end

    private
    
  end
end
