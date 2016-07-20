module Admin
  class UsersController < BaseController
    
    def index
      @users = SchoolUser.all.paginate(:page => params[:page], :per_page => 20)
    end

    private
    
  end
end
