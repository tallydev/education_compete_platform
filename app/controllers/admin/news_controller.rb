module Admin
  class NewsController < BaseController

    def index
      @news = News.where(type: params[:type]).paginate(:page => params[:page], :per_page => 20)
    end

    private
  end
end
