class AppraisesController < ApplicationController
  before_action :set_appraise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @appraises = Appraise.all
    respond_with(@appraises)
  end

  def show
    respond_with(@appraise)
  end

  def new
    @appraise = Appraise.new
    respond_with(@appraise)
  end

  def edit
  end

  def create
    @appraise = Appraise.new(appraise_params)
    @appraise.save
    respond_with(@appraise)
  end

  def update
    @appraise.update(appraise_params)
    respond_with(@appraise)
  end

  def destroy
    @appraise.destroy
    respond_with(@appraise)
  end

  private
    def set_appraise
      @appraise = Appraise.find(params[:id])
    end

    def appraise_params
      params[:appraise]
    end
end
