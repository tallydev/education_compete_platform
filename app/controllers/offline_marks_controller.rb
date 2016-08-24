class OfflineMarksController < ApplicationController
  before_action :authenticate_expert!, only: [:update]

  before_action :set_browser
  layout :phone_layout

  respond_to :html

  def edit
    @activity = Activity.find(params[:activity_id])
    @recruit = @activity.recruits.find(params[:recruit_id])
    @player_info = @recruit.player.info
    if current_expert.present?
      @mark = @recruit.marks.where(expert_id: current_expert.id).first
    end
  end

  def update
    _activity = Activity.find(params[:activity_id])
    @recruit = _activity.recruits.find(params[:recruit_id])
    @mark = @recruit.marks.where(expert_id: current_expert.id).first

    array = [params[:mark_one],params[:mark_two],params[:mark_three],params[:mark_four]].map { |num| num.to_i }

    if @mark.update(item_array: array)
      flash[:success] = "评分成功"
    else
      flash[:danger] = "评分失败！"
    end

    redirect_to phones_path(activity_id: _activity)
  end
end
