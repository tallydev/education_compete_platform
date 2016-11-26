class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    @events = Event.all.paginate(page: page, per_page: per_page)
    @bulletins = Event.all.where(classify: 1).order(created_at: :DESC).limit(7)
    @headlines = Event.all.where(classify: 2).order(created_at: :DESC).limit(5)
    @activities = Event.all.where(classify: 3).order(created_at: :DESC).limit(4)
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  # def create
  #   @event = Event.new(event_params)
  #   @event.save
  #   respond_with(@event)
  # end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :content, :classify, :picture_url, :is_competition, :picture_url)
    end
end
