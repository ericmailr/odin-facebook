class CommentsController < ApplicationController
    def create
        post = Post.find(comment_params[:post_id])
        comment = post.comments.build(comment_params)
        if comment.save
            flash[:success] = "Comment posted"
        else
            flash[:failure] = "Could not comment"
        end
        redirect_to posts_path
    end

    private
        def comment_params
            params.require(:comment).permit(:post_id, :commenter_id, :body)
        end
end
