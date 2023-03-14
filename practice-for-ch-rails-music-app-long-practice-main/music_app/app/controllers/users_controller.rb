class UsersController < ApplicationController
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user.id)
        else  
            render json: @user.errors.full_messages, status: 422
        end
    end 

    def new 
        @user = User.new 
        render :new 
    end 

    def show 
        @user = User.find(params[:id])
        if !@user.nil?
            render :show
        else  
            redirect_to new_user_url
        end
    end 

    private 
    def user_params
        params.require(:user).permit(:email, :password)
    end 
end 