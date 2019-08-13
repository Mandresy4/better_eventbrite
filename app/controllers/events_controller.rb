class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_signed_in?, except: [:index, :show]

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
  end

  def destroy
  end
end
