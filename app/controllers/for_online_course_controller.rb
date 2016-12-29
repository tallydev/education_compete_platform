class ForOnlineCourseController < ApplicationController

  respond_to :json

  #get opus_index
  def opus_index
    # ""会被to_i 转为0
  	@page = (params[:page] || 1).to_i
    @per_page = (params[:per_page] || 10).to_i

    @opuses = InfoCompetition::Opus.all.concat TalkCompetition::Opus.all
    #跨模型 对Array分页
  	@opuses = @opuses[(@page - 1) * (@per_page) .. @per_page - 1 + (@page - 1) * (@per_page)]
    p @opuses.count
  	respond_with @opuses, template: 'for_online_course/opus_index'
  end

  #params[:class] params[:id]
  #TalkCompetition::Opus InfoCompetition::Opus
  def opus_show
  	@opus = send(params[:class]).find(params[:id])
  	respond_with @opus, template: 'for_online_course/opus_show'
  end
end
