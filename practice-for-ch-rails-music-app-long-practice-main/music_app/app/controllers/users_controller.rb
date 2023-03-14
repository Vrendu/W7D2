class UsersController < ApplicationController
    def index 
        users = User.all 
        render :index 
    end 
    
    def create

    end 

    def new 
        @user = User.new 
        render :new 
    end 

    def show 

    end 
end 