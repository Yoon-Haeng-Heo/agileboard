class CommentsController < ApplicationController

    def create
      @comment = Post.find_by(id: comment_params[:commentable_id]).comments.create
      @comment.user_id = current_user.id
      @comment.comment = comment_params[:body]
      @comment.save
      redirect_to post_path(comment_params[:commentable_id])
    end

    def update
    end

    def edit
    end

    def destroy
    end
  
    private
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
  
    def load_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def load_commentable
      @post = Post.find_by(id: params[:comment][:commentable_id])
    end
end
