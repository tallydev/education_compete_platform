class NotificationsController < ApplicationController
	def index
    @notifications = Bulletin.all
	end

	def show
    @notification = Bulletin.find(params[:id])
    @activity = @notification.try(:activity)
	end
end
