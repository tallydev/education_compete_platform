class AppraisesController < ApplicationController
  acts_as_token_authentication_handler_for Player 

  before_action :set_appraise, only: [:show]

  respond_to :json

  def index####
    page = params[:page] || 1
    per_page = params[:per_page] || 15
    @appraises = Appraise.all.paginate(page: page, per_page: per_page)
    respond_with(@appraises)
  end

  def show###
    respond_with(@appraise)
  end

  def create
    @appraise = Appraise.new(appraise_params)
    if @appraise.save
      respond_with(@appraise)   
    else
      @error = "学员评师内容创建 失败 ！" 
      respond_with(@error)
    end    
  end

  # def update
  #   @appraise.update(appraise_params)
  #   respond_with(@appraise)
  # end

  # def destroy
  #   @appraise.destroy
  #   respond_with(@appraise)
  # end

  private
    def set_appraise
      @appraise = Appraise.find(params[:id])
    end

    def appraise_params
      params.require(:appraise).permit(:player_id, :teacher_id, :remark, :degree, :training_course_id)
    end
end
