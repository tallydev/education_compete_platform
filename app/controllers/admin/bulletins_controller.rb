module Admin
  class BulletinsController < BaseController
    protect_from_forgery :except => :create  

    def index
      @bulletins = Bulletin.all.paginate(:page => params[:page], :per_page => 20)
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = Bulletin.new(bulletin_params)
      if @bulletin.save
        flash[:success] = "创建成功"
        redirect_to admin_bulletins_path
      else
        flash[:danger] = "创建失败"
        render :new
      end
    end

    private
    def bulletin_params
      params.require(:bulletin).permit(:title, :content, :activity_id, paper_attributes: [:id, :file, :_destroy] )
    end
  end
end
