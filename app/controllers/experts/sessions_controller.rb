class Experts::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  before_action :set_browser

  layout :login_layout

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:phone, :password, :password_confirmation, :name) }
  # end
  private
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

    def login_layout
      @layout
    end
end
