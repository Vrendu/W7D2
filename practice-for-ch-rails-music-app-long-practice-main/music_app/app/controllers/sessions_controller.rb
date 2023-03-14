class SessionsController < ApplicationController 
    def new 
        @user = User.new
        render :new 
    end 

    def create 
        #this is logging someone in who is already in the database 
        incoming_username = params[:user][:email]
        incoming_password = params[:user][:password]
        @user = User.find_by_credentials(incoming_username, incoming_password)

        if @user 
            login(@user)
            redirect_to user_url(@user.id) #this part is up to individual, what to do after logging in a user  
        else  
            render :new 
        end
    end 

    def destroy
        logout #this method was written in ApplicationController 
        redirect_to new_session_url #this again is up to individual, what to do after logging out a user 
    end 
end 