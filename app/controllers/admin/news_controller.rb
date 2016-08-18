module Admin
  class NewsController < BaseController
    protect_from_forgery :except => :create  
    # respond_to :html, :js

    def index
      @news = News.all.paginate(:page => params[:page], :per_page => 20)
    end

    def new
      @news = News.new
    end

    def create
      @news = News.new(news_params)
      if @news.save
        flash[:success] = "创建成功"
        redirect_to admin_news_index_path
      else
        flash[:danger] = "创建失败"
        render :new
      end
    end

    private
    def news_params
      params.require(:news).permit(:title, :summary, :activity_id, paper_attributes: [:id, :file, :_destroy] )
    end
  end
end
