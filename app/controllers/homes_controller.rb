class HomesController < ApplicationController
  before_action :set_browser
  layout :login_layout
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

  # 选择某个线下比赛后跳转，选手列表页（手机端选择比赛后的主页）
  def phone
  	@recruits_online = Activity.find(params[:activity_id]).recruits
  end

  private
  	def from_phone?
  		@browser == :phone
  	end
end
