class UsersController < ApplicationController
    before_action :authenticate_user!    
    def index
        @users = User.all
        @unrequestable_users = current_user.pending_friends + current_user.friends << current_user

        @requestable_users = User.all - ([current_user] + current_user.friends + current_user.pending_friends + current_user.requesting_friends)
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts
    end

    def update
        @user = User.find(params[:user_id])
        @user.profile = true
        if @user.save
            flash[:success] = "Profile created."
            redirect_to user_path
        else
            flash[:failure] = "Profile could not be created."
        end
    end
end
