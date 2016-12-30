class OpusesController < ApplicationController
	before_action :authenticate_expert!, only: [:index], if: -> {!(current_expert.present? || current_school_user.present?)}
	before_action :authenticate_school_user!, only: [:index], if: -> {!(current_expert.present? || current_school_user.present?)}

	def index
	  @activities = Activity.onlines
	  activity_id = params[:activity_id] || @activities.first.id
	  type = params[:type] || @activities.first.type
	  _activity = type == "InfoCompetition::Activity" ? InfoCompetition::Activity : TalkCompetition::Activity
    @activity = _activity.find(activity_id)
		@recruits = @activity.recruits
	end 
end
