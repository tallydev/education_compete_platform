class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_events = Admin::Event.all
    respond_with(@admin_events)
  end

  def show
    respond_with(@admin_event)
  end

  def new
    @admin_event = Admin::Event.new
    respond_with(@admin_event)
  end

  def edit
  end

  def create
    @admin_event = Admin::Event.new(admin_event_params)
    @admin_event.save
    respond_with(@admin_event)
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
      @admin_event = Admin::Event.find(params[:id])
    end

    def admin_event_params
      params[:admin_event]
    end
end
