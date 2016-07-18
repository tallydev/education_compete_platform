class NotificationsController < ApplicationController
	def index
    @notifications = Bulletin.all
	end

	def show
    @notification = Bulletin.find(params[:id])
    @activity = @notification.try(:activity)
    @recruit = @activity.recruits.find_by_player_id(current_player.id)
	end
end
