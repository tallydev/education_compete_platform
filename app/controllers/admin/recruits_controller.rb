module Admin
  class RecruitsController < BaseController
    protect_from_forgery :except => :create  
    before_action :set_activity

    def index
      @recruits = @activity.recruits.paginate(:page => params[:page], :per_page => 20)
    end

    def new
      # @bulletin = Bulletin.new
    end

    def create
      # @bulletin = Bulletin.new(bulletin_params)
      # if @bulletin.save
      #   flash[:notice] = "创建成功"
      #   redirect_to admin_bulletins_path
      # else
      #   flash[:error] = "创建失败"
      #   render :new
      # end
    end

    private
    def bulletin_params
      params.require(:bulletin).permit(:title, :content, :activity_id, paper_attributes: [:id, :file, :_destroy] )
    end

    def set_activity
      @activity = Activity.find_by(id: params[:activity_id])
    end
  end
end
