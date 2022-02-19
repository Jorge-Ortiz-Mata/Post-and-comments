class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        #render 'comments/comment'
        redirect_to root_path
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to root_path, status: 303
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter)
        end
end
