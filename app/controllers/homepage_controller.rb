class HomepageController < ApplicationController
  def index
    @user = current_user
    @events = []
    @temp = @user.rsvp.to_s
    if @temp.length > 0
      @events = @temp.split('.').map(&:to_i)
    end
  end
  
  helper_method :hide_message
  def hide_message 
    "hide_message" if @clubs.length >= 1
  end
end
