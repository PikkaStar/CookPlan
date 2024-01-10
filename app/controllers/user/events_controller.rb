class User::EventsController < ApplicationController

  def create
    event = Event.new(event_params)
    event.save
    if flash[:notice] = "カレンダーに記入しました"
    redirect_to events_path
    else
      flash[:alert] = "記入できませんでした"
      @event = Event.find(params[:id])
      render :show
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_new = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if flash[:notice] = "更新しました"
      redirect_to events_path
    else
      flash[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "削除しました"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title,:content,:start_time,:end_time)
  end

end
