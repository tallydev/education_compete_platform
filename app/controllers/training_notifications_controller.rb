class TrainingNotificationsController < ApplicationController
  before_action :set_training_notification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @training_notifications = TrainingNotification.all
    respond_with(@training_notifications)
  end

  def show
    respond_with(@training_notification)
  end

  def new
    @training_notification = TrainingNotification.new
    respond_with(@training_notification)
  end

  def edit
  end

  def create
    @training_notification = TrainingNotification.new(training_notification_params)
    @training_notification.save
    respond_with(@training_notification)
  end

  def update
    @training_notification.update(training_notification_params)
    respond_with(@training_notification)
  end

  def destroy
    @training_notification.destroy
    respond_with(@training_notification)
  end

  private
    def set_training_notification
      @training_notification = TrainingNotification.find(params[:id])
    end

    def training_notification_params
      params[:training_notification]
    end
end
