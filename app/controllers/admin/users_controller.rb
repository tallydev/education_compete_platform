module Admin
  class UsersController < BaseController
    before_action :set_user, only: [:destroy]

    def index
      @users = Player.all.paginate(:page => params[:page], :per_page => 20)
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    private
      def set_user
        @user = Player.find params[:id]
      end
  end
end
