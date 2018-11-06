class PostsController < ApplicationController
    before_action :authenticate_user!

    def create
        post = current_user.posts.build(body: post_params[:body], user_id: current_user.id)
        if post.save
            flash[:success] = "Post submitted!"
        else
            flash[:failure] = "Could not submit post. Did you include a title and body?"
        end
        redirect_to posts_path
    end

    def index
        @posts = []
        @posts << current_user.posts
        current_user.friends.each do |friend|
            @posts << friend.posts
        end
        @posts = @posts.flatten
        @posts = (@posts.sort_by &:updated_at).reverse
    end

    def destroy

    end

    private 
        
        def post_params
            params.require(:post).permit(:body, :user_id)
        end
end
