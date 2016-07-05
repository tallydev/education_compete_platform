require "application_responder"

module Admin
  class BaseController < ActionController::Base
    before_action :authenticate_user!
    self.responder = ApplicationResponder
    respond_to :html
    layout 'admin'

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  end
end
