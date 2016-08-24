require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  	# 判断浏览器
  	def set_browser
	    user_agent = request.env['HTTP_USER_AGENT'].downcase 
	    if user_agent.include?("iphone") || user_agent.include?("android")
	      @browser = :phone
	      @layout = "phone"
	    else
	      @browser = :computer
	      @layout = "application"
	    end
	  end

	  # 动态指定模板
	  def login_layout
	    @layout
	  end
end
