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

=begin 대댓글기능

https://dev.to/lucysuddenly/nested-comments-in-ruby-on-rails-1k1f

before_action :find_commentable, only: :create

    def new
      @comment = Comment.new
    end

    def create
      @commentable.comments.build(comment_params)
      @commentable.save
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_commentable
      if params[:comment_id]
        @commentable = Comment.find_by_id(params[:comment_id]) 
      elsif params[:post_id]
        @commentable = Post.find_by_id(params[:post_id])
      end
    end
    
=end