class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user 
    #rails gives this to me 
    #session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def require_logged_in 
    #redirect unless a person is logged in 
        redirect_to new_session_url unless logged_in?
    end 

    def require_logged_out 
    #redirect if logged in 
        redirect_to users_url if logged_in?
    end     

    def logged_in? 
        !!current_user #one ! would make a nil current_user turn to false, one more ! to set it to the correct boolean
    end 

    def login(user) #only crrlll method that has an argument 
    #reset the session_token to match the users session_token
        session[:session_token] = user.reset_session_token
    end 

    def logout 
        current_user.reset_session_token if logged_in? 
        session[:session_token] = nil 
        @current_user = nil 
    end
end
