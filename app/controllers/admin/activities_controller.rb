module Admin
  class ActivitiesController < BaseController

    def index
      @activities = Activity.paginate(:page => params[:page], :per_page => 20)
    end
    
    def new
      @activity = Activity.new
    end

    def create
      @activity = Activity.new(activity_params)
      if @activity.save
        flash[:notice] = "创建成功"
        redirect_to admin_activities_path
      else
        flash[:error] = "创建失败"
        render :new
      end
    end

    private 

    def activity_params
      params.require(:activity).permit(:name, :start_time, :end_time)
    end
  end
end
