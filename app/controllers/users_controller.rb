class UsersController < ApplicationController
    
  def user_params
    params.require(:user).permit(:bnumber, :course_level, :major, :dob, :year,:rsvp )
  end  
  
  
  def show
    @user = User.find params[:id]
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "User Profile updated"
    redirect_to homepage_index_path
  end
 
end
