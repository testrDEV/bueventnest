class SessionsController < ApplicationController
    #User can't be logged in before logging in
    skip_before_filter :can_proceed
    
    class DoubleLoginError < ArgumentError ; end
    class NotCurrentUserError < ArgumentError ; end
    class InvalidEmailError < ArgumentError ; end
      
    def new
    end
    
    def create
      begin
      #user is alreaddy logged in 
        if session?
          if same_as_logged_in_user? auth_hash['info']
            raise DoubleLoginError,
              "Login inside a Login, is this inception? You're already logged in"
          else
            raise NotCurrentUserError,
              "Your Jedi mind tricks wont work on us! - Access Denied!"
          end         
        else #Login or signup
          # User has already registered and is logging in with the same provider
          if Authorization.exists?(auth_hash)
            auth = Authorization.find_with_omniauth(auth_hash)
            message = "Welcome back #{auth.user.name}!" +
                        "You have logged in via #{auth.provider}."
            # create current_user and session
            session[:user_id] = auth.user.id
            self.current_user = auth.user
            flash[:notice] = "#{message}"
            redirect_to homepage_index_path and return
          else 
            #user ahs already registered  and is  logging in with new provider
            if User.exists?(auth_hash['info'])
              user = User.find_with_omniauth(auth_hash)
              auth = user.add_provider(auth_hash)
              message = 
                "You can log in using #{auth_hash[provider].capitalize}"
              # create current_user and session
              session[:user_id] = auth.user.id
              self.current_user = auth.user
              flash[:notice] = "#{message}"
              redirect_to homepage_index_path and return
        
            else # User is registering with a given provider
                # Check the user email and if not BU go to failure path
                user = User.create_with_omniauth(auth_hash['info'])
                if user.email.split('@')[1] == 'binghamton.edu'
                  auth = user.authorizations.create_with_omniauth(auth_hash)
                  message =
                      "Welcome #{user.name}! You've signed up via #{auth.provider}."
                  # create current_user and session
                  session[:user_id] = auth.user.id
                  self.current_user = auth.user
                  flash[:notice] = "#{message}"
                  redirect_to homepage_index_path and return
                else
                  raise InvalidEmailError, "Sorry young padawan, only @binghamton.edu users can pass"
                end
            end
          end
        end
       
      rescue DoubleLoginError, NotCurrentUserError,InvalidEmailError, Exception => exception
          flash[:error] = " #{exception.message}"
          redirect_to auth_failure_path 
      end        
    end
    
    def failure
      begin
      rescue Exception  => exception 
        flash[:error] = "#{exception.class}: #{exception.message}"
        redirect_to welcome_login_path
      end
    end
    
    def destroy
      #render :text => "logged out."
      message = "#{self.current_user.name} has logged out"
      self.current_user = nil
      session.delete(:user_id)
      reset_session
      flash[:notice] = message
      redirect_to welcome_login_path
    end
    
    def auth_hash
        # get Omniauth authentication hash
        @auth_hash ||= request.env['omniauth.auth']
    end
    
    def session?
       !!session[:user_id] 
    end
    
    def same_as_logged_in_user? info
       user = User.find(session[:user_id]) 
       user.name == info['name'] && user.email == info['email']
    end
    
    def cleanup
      reset_session
      flash[:warning] = "Session Reset"
      redirect_to welcome_login_path
    end
    
end
