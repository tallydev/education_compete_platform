class TrainingNotificationsController < ApplicationController
  before_action :set_training_notification, only: [:show]

  respond_to :json

  def index
    @category = params[:category].present?? params[:category] : "1"
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @training_notifications = TrainingNotification.all.find_category(@category).paginate(page: page, per_page: per_page)
    respond_with(@training_notifications)
  end

  def show
    @training_notification.update(view_count: @training_notification.view_count + 1)
    respond_with(@training_notification)
  end

  private
    def set_training_notification
      @training_notification = TrainingNotification.find(params[:id])
    end
end
