class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :can_proceed
  helper_method :current_user, :logged_in?
  
  protected
  
  #gaurds against unauthorized access
  def can_proceed
    redirect_to welcome_logn_path and return unless current_user
  end  
  
  
  #accessor
  def current_user
    # Avoid unnecessary database queries
    @current_user ||= User.find(session[:user_id])
  end
  
  # predicate
  def logged_in?
    # So it returns true or false
    !!current_user
  end
  

  # setter (gets set in sessions controller)
  def current_user=(user)
    @current_user = user
  end  
end
