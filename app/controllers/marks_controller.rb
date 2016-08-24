class MarksController < ApplicationController
  before_action :authenticate_expert!, only: [:update]
  # 浏览器检测
  before_action :set_browser

  respond_to :html, :js

  def update
    array = []
    if @browser == :phone
      array = [params[:mark_one],params[:mark_two],params[:mark_three],params[:mark_four]].map { |num| num.to_i }
    else
      array = params[:itemArray][0].split(",").map { |item| item.to_i }
    end

    if params[:type] == "info"
      @markInfo = InfoCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
      @opusInfo = InfoCompetition::Opus.find(params[:opus_id])
      if @markInfo.update(item_array: array)
        flash[:success] = "评分成功"
      else
        flash[:danger] = "评分失败！"
      end

      if @browser
        redirect_to phones_path(activity_id: params[:activity_id])
      else
        respond_with @opusInfo
      end
    elsif params[:type] == "talk"
      @markTalk = TalkCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
      @opusTalk = TalkCompetition::Opus.find(params[:opus_id])
      if @markTalk.update(item_array: array)
        flash[:success] = "评分成功"
      else
        flash[:danger] = "评分失败！"
      end

      if @browser
        redirect_to phones_path(activity_id: params[:activity_id])
      else
        respond_with @opusTalk
      end
    end
  end
end
