class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :update, :destroy]

  respond_to :html

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    @admin_events = Event.all.paginate(page: page, per_page: per_page)
    respond_with(@admin_events)
  end

  def show###
    respond_with(@admin_event)
  end

  def create
    @admin_event = Event.new(admin_event_params)
    if @admin_event.save
      respond_with(@admin_event) 
    else
      @error = "创建网站 内容失败 ！"
      respond_with(@error)
    end
  end

  def update
    @admin_event.update(admin_event_params)
    respond_with(@admin_event)
  end

  def destroy
    @admin_event.destroy
    respond_with(@admin_event)
  end

  private
    def set_admin_event
      @admin_event = Event.find(params[:id])
    end

    def admin_event_params
      params.require(:event).permit(:title, :classify, :content, :picture_url, :is_competition)
    end
end
