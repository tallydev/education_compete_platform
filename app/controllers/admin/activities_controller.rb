module Admin
  class ActivitiesController < BaseController

    before_action :set_activity, only: [:show, :update, :edit, :destroy]
    respond_to :html, :js

    def index
      @activities = Activity.paginate(:page => params[:page], :per_page => 20)
    end
    
    def new
      @activity = Activity.new
    end

    def show
      
    end

    def edit
      respond_with @activity
    end

    def update
      if @activity.update(activity_params)
        flash[:success] = "修改赛事信息成功"
        respond_to do |format|
          format.js { render js: "location.href = '#{admin_activities_path}'" }
        end
      else
        flash[:danger] = "修改赛事信息失败"
        render :edit
      end
    end

    def destroy
      @activity.destroy
      redirect_to admin_activities_path
    end

    def create
      @activity = Activity.new(activity_params)
      if @activity.save
        flash[:success] = "创建成功"
        redirect_to admin_activities_path
      else
        flash[:danger] = "创建失败"
        render :new
      end
    end

    private

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :start_time, :end_time, :short_name, :type, :offline)
    end
  end
end
