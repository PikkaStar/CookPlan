class User::EventsController < ApplicationController

  def create
    @event = Event.new(event_params)
    if @event.save
    redirect_to events_path
    else
      @events = Event.all
      render :index
      @event = Event.new
    end
  end

  def index
    @event = Event.new
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title,:cooking_number)
  end

end
