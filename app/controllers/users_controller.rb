class UsersController < ApplicationController
 def new 
    end
    def index
        @users = User.all
    end
    
    def new_user
        redirect_to signup_path
    end
    
    def login
       redirect_to login_path 
    end
end
