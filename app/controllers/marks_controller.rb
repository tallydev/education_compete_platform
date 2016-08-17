class MarksController < ApplicationController
  before_action :set_mark, only: [:update]
  before_action :authenticate_expert!, only: [:update]
  respond_to :html, :js

  def update
    array = params[:itemArray][0].split(",").map { |item| item.to_i }
    if params[:type] == "info"
      if @markInfo.update(item_array: array)
        flash[:success] = "评分成功"
        p @markInfo
        p "======================================"
        respond_with @opusInfo
      else
        flash[:error] = "评分失败！"
        respond_with @opusInfo
      end
    elsif params[:type] == "talk"
      if @markTalk.update(item_array: array)
        flash[:success] = "评分成功"
        p @markTalk
        p "======================================"
        respond_with @opusTalk
      else
        flash[:error] = "评分失败！"
        respond_with @opusTalk
      end
    end
    p "++++++++++++++++++++++++++"
    p params[:type]
  end

  private
  def set_mark
    @markInfo = InfoCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
    @opusInfo = InfoCompetition::Opus.find(params[:opus_id])
    @markTalk = TalkCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
    @opusTalk = TalkCompetition::Opus.find(params[:opus_id])
  end
end
