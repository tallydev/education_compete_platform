class SchoolUsers::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    p "==========#{params}==========="
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:phone, :password, :password_confirmation, :name) }
  end
end
