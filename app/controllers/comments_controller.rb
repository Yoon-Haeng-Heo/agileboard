class CommentsController < ApplicationController
  before_action :load_commentable, only: %i(create new)
  before_action :load_comment, only: %i(destroy edit update)

  def create
    @comment = @commentable.comments.create comment_params
  end

  def update
    @comment.update comment_params
  end

  def edit;end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :commentable_id, :commentable_type, :user_id)
  end

  def load_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def load_commentable
    # pass 순서
    # post/show.html.erb에서 local로 commentable = @post
    # _new.html.erb에서 commentable.id가 넘어온다
    @commentable = Post.find_by(id: params[:comment][:commentable_id])
  end
end

=begin
  
params[:comment][:commentable_type]=="Comment" ?  @commentable = Comment.find_by(id: params[:comment][:commentable_id]) : 
  
=end