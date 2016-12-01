class Admin::TrainingNotificationsController < ApplicationController
  acts_as_token_authentication_handler_for Admin 
  before_action :set_admin_training_notification, only: [:show, :update]

  respond_to :json

  def index
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_training_notifications = TrainingNotification.all.find_keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@admin_training_notifications)
  end

  def show
    respond_with(@admin_training_notification)
  end

  def create
    @admin_training_notification = TrainingNotification.new(admin_training_notification_params)
    if @admin_training_notification.save
      respond_with(@admin_training_notification)  
    else
      @error = "培训通知内容创建 失败 ！"
      respond_with(@error, template: "error")
    end
  end

  def update
    @admin_training_notification.update(admin_training_notification_params)
    respond_with(@admin_training_notification, template:"admin/training_notifications/show", status: 201)
  end

  # def destroy
  #   @admin_training_notification.destroy
  #   respond_with(@admin_training_notification)
  # end

  private
    def set_admin_training_notification
      @admin_training_notification = TrainingNotification.find(params[:id])
    end

    def admin_training_notification_params
      params.require(:training_notification).permit(:title, :sub_title, :view_count, :author, :content, :category)
    end
end
