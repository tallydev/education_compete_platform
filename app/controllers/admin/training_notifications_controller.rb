class Admin::TrainingNotificationsController < ApplicationController
  before_action :set_admin_training_notification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_training_notifications = Admin::TrainingNotification.all
    respond_with(@admin_training_notifications)
  end

  def show
    respond_with(@admin_training_notification)
  end

  def new
    @admin_training_notification = Admin::TrainingNotification.new
    respond_with(@admin_training_notification)
  end

  def edit
  end

  def create
    @admin_training_notification = Admin::TrainingNotification.new(admin_training_notification_params)
    @admin_training_notification.save
    respond_with(@admin_training_notification)
  end

  def update
    @admin_training_notification.update(admin_training_notification_params)
    respond_with(@admin_training_notification)
  end

  def destroy
    @admin_training_notification.destroy
    respond_with(@admin_training_notification)
  end

  private
    def set_admin_training_notification
      @admin_training_notification = Admin::TrainingNotification.find(params[:id])
    end

    def admin_training_notification_params
      params[:admin_training_notification]
    end
end
