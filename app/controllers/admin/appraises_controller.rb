class Admin::AppraisesController < ApplicationController
  acts_as_token_authentication_handler_for Admin  
  before_action :set_admin_appraise, only: [:show]

  respond_to :json

  def index ##
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_appraises = Appraise.all.paginate(page: page, per_page: per_page)
    respond_with(@admin_appraises)
  end

  def list #搜索显示列表
    @keyword = params[:keyword].present?? params[:keyword] : " "
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @admin_appraises = Appraise.all.keyword(@keyword).paginate(page: page, per_page: per_page)
    respond_with(@admin_appraises)
  end

  def show
    respond_with(@admin_appraise)
  end

  private
    def set_admin_appraise
      @admin_appraise = Appraise.find(params[:id])
    end
end
