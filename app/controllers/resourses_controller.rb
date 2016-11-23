class ResoursesController < ApplicationController
  before_action :set_resourse, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resourses = Resourse.all
    respond_with(@resourses)
  end

  def show
    respond_with(@resourse)
  end

  def new
    @resourse = Resourse.new
    respond_with(@resourse)
  end

  def edit
  end

  def create
    @resourse = Resourse.new(resourse_params)
    @resourse.save
    respond_with(@resourse)
  end

  def update
    @resourse.update(resourse_params)
    respond_with(@resourse)
  end

  def destroy
    @resourse.destroy
    respond_with(@resourse)
  end

  private
    def set_resourse
      @resourse = Resourse.find(params[:id])
    end

    def resourse_params
      params.require(:resourse).permit(:type, :resourse_type, :catalog)
    end
end
