class HomesController < ApplicationController
  before_action :set_browser
  layout :phone_layout
  # 根据是否是手机浏览器，设置鉴权
  before_action :authenticate_expert!, if: :from_phone?

  def index
  	# 如果来自手机端，显示线下比赛列表
  	if @browser == :phone
	    @activities = Activity.offlines.activate
  	else
  		@activities = Activity.activate
	  	@notifications = Bulletin.all
  	end
  end

  private
  	def from_phone?
  		@browser == :phone
  	end
end
