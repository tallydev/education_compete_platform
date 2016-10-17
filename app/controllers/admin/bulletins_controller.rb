module Admin
  class BulletinsController < BaseController
    protect_from_forgery :except => [:create, :update]  
    before_action :set_bulletin, only: [:show, :update, :edit, :destroy]

    respond_to :html, :js

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

    def edit
      respond_with @bulletin
    end

    def update
      if @bulletin.update(bulletin_params)
        flash[:success] = "修改成功"
        respond_to do |format|
          format.js { render js: "location.href = '#{admin_bulletins_path}'" }
        end
      else
        flash[:danger] = "修改失败"
        render :new
      end
    end

    def destroy
      @bulletin.destroy
      redirect_to admin_bulletins_path
    end

    private

    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end

    def bulletin_params
      params.require(:bulletin).permit(:title, :content, :activity_id, paper_attributes: [:id, :file, :_destroy] )
    end
  end
end
