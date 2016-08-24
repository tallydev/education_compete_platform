class HomesController < ApplicationController
  before_action :set_browser
  layout :phone_layout
  # 根据是否是手机浏览器，设置鉴权
  before_action :authenticate_expert!, if: :from_phone?

  def index
  	# 如果来自手机端，显示线下比赛列表
  	if @browser == :phone
	    @activities = Activity.offlines
  	else
  		@activities = Activity.onlines
	  	@notifications = Bulletin.all
	    @one_days = Activity.find(1).left_days
	    @two_days = Activity.find(2).left_days
  	end
  end

  private
  	def from_phone?
  		@browser == :phone
  	end
end
