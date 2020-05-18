class HomepageController < ApplicationController
  def index
    @user = current_user
    @events = []
    @rsvp = @user.rsvp.to_s
    if @rsvp.length > 0
      @events = @rsvp.split('.').map(&:to_i)
    end
  end
end
