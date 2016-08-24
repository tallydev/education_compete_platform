class PhonesController < ApplicationController
	before_action :set_browser
  layout :phone_layout
  # 根据是否是手机浏览器，设置鉴权
  before_action :authenticate_expert!

	# 选择某个线下比赛后跳转，选手列表页（手机端选择比赛后的主页）
	def index
		# 获取的为线下的比赛
		_activity = Activity.find(params[:activity_id])
		@recruits_offline = _activity.recruits
	end
end