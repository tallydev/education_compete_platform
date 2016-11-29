class Admin::AppraisesController < ApplicationController
  before_action :set_admin_appraise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_appraises = Admin::Appraise.all
    respond_with(@admin_appraises)
  end

  def show
    respond_with(@admin_appraise)
  end

  def new
    @admin_appraise = Admin::Appraise.new
    respond_with(@admin_appraise)
  end

  def edit
  end

  def create
    @admin_appraise = Admin::Appraise.new(admin_appraise_params)
    @admin_appraise.save
    respond_with(@admin_appraise)
  end

  def update
    @admin_appraise.update(admin_appraise_params)
    respond_with(@admin_appraise)
  end

  def destroy
    @admin_appraise.destroy
    respond_with(@admin_appraise)
  end

  private
    def set_admin_appraise
      @admin_appraise = Admin::Appraise.find(params[:id])
    end

    def admin_appraise_params
      params[:admin_appraise]
    end
end
