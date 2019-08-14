class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create

    puts "#"*60
    puts params
    puts "#"*60
    
    @event = Event.new(start_date:params[:start_date].to_datetime, duration:params[:duration], title:params[:title], description:params[:description], price:params[:price], location:params[:location], admin:current_user)

    if @event.save 

    flash[:success] = "Ton event qui déchire a été ajouté dans la liste!"
    redirect_to event_path(@event.id)

    else

    render 'new'

    end
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(duration:params[:duration], price:params[:price], location:params[:location])

        flash[:success] = "L'event a été édité!"
        redirect_to event_path
    else
      render :edit
    end

  end

  def destroy
    @event = Event.find(params[:id])

      if @event.destroy 
      flash[:success] = "Ton event a bien été supprimé!"
      redirect_to events_path   

      else
        render :destroy
      end
  end
end
