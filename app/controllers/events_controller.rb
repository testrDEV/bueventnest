class EventsController < ApplicationController
  def events_params
    params.require(:event).permit(:name,:description,:location,:start_date,:end_date,:contact,:seats)
  end
  
  def index
    
  
    @sort = params[:sort] || session[:sort]
    @events = Event.all
    
    if params[:sort] != session[:sort]
      session[:sort] = @sort
    end
    
    if (params[:sort].nil? and !(session[:sort].nil?))
      flash.keep
      redirect_to events_path(sort: @sort)
    end
  
  end
  
  def new
  end
  
  def create
    @event = Event.create!(events_params)
    flash[:notice] = "You successfully created #{@event.name}."
    redirect_to events_path
  end
  
  def destroy
    @event= Event.find params[:id]
    @event.destroy
    flash[:notice] = "You successfully deleted #{@event.name}."
    redirect_to events_path
  end
  
  def edit
    @event= Event.find params[:id]
  end
  
  def update
    @event= Event.find params[:id]
    @event.update_attributes!(events_params)
    flash[:notice] = "You successfully updated #{@event.name}."
    redirect_to events_path
  end
  
  def show
    @event= Event.find params[:id]
  end
  
  def rsvp
    @event= Event.find params[:id]
    @user = current_user
    @temp = @user.rsvp.to_s
    @events = @temp.split('.').map(&:to_i)
    
    if !(@events.include? params[:id].to_i)
      @events.push(params[:id].to_i)
      @temp = @events.sort.join('.')
      @user.rsvp = @temp
      @user.save
      flash[:notice] ="Congratulations, you are now attending #{@event.name}!"
    else
      @events.delete(params[:id].to_i)
      @temp = @events.sort.join('.')
      @user.rsvp = @temp
      @user.save
      flash[:notice] = "You are not attending #{@event.name}."
    end
    redirect_to event_path(@event)
  end
  
  
end
