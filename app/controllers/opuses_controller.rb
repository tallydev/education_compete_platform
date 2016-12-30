class OpusesController < ApplicationController
	def index
	  @activities = Activity.onlines
	  activity_id = params[:activity_id] || @activities.first.id
	  type = params[:type] || @activities.first.type
	  _activity = type == "InfoCompetition::Activity" ? InfoCompetition::Activity : TalkCompetition::Activity
    @activity = _activity.find(activity_id)
		@recruits = @activity.recruits
	end 
end
