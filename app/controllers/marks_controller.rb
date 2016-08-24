class MarksController < ApplicationController
  before_action :authenticate_expert!, only: [:update]
  respond_to :html, :js

  def update
    array = params[:itemArray][0].split(",").map { |item| item.to_i }

    if params[:type] == "info"
      @markInfo = InfoCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
      @opusInfo = InfoCompetition::Opus.find(params[:opus_id])
      if @markInfo.update(item_array: array)
        flash[:success] = "评分成功"
      else
        flash[:danger] = "评分失败！"
      end
      respond_with @opusInfo
    elsif params[:type] == "talk"
      @markTalk = TalkCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
      @opusTalk = TalkCompetition::Opus.find(params[:opus_id])
      if @markTalk.update(item_array: array)
        flash[:success] = "评分成功"
      else
        flash[:danger] = "评分失败！"
      end
      respond_with @opusTalk
    end
  end
end
