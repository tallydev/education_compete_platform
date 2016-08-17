class MarksController < ApplicationController
  before_action :set_mark, only: [:update]
  before_action :authenticate_expert!, only: [:update]
  respond_to :html, :js

  def update
    if params[:type] == "info"
      array = params[:itemArray][0].split(",")

      p array

      p @mark
      if @mark.update(item_array: array)
        flash[:success] = "评分成功"
        p @mark
        p "======================================"
        respond_with @opus
      else
        flash[:error] = "评分失败！"
        respond_with @opus
      end
    end
    p "++++++++++++++++++++++++++"
    p params[:type]
  end

  private
  def set_mark
    @mark = InfoCompetition::Opus.find(params[:opus_id]).recruit.marks.where(expert_id: current_expert.id).first
    @opus = InfoCompetition::Opus.find(params[:opus_id])
  end
end
