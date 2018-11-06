class LikesController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        like = post.likes.build(post_id: params[:post_id], liker_id: params[:liker_id])
        if like.save
            flash[:success] = "Post liked"
        else
            flash[:failure] = "Could not like post"
        end
        redirect_to posts_path
    end

end
