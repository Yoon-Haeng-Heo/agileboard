class CommentsController < ApplicationController
  before_action :load_commentable, only: %i(create)
  before_action :load_comment, only: %i(destroy)
  
  def create
    mentionee = []
    mention_email = []
    name_pattern = /[@|\s@][가-힣]\s[가-힣][가-힣]/
    extracted_names = params[:comment][:comment].scan(name_pattern)
    extracted_names.each do |name| mentionee << name[1..] end
    if mentionee.size != 0
      @comment = @commentable.comments.new
      @comment.comment =''
      mentionee.each do |name| 
        @comment.mention!(User.find_by(name: name))
        mention_email << User.find_by(name: name).email
      end
      params[:comment][:comment].each_char do |char|
        if char != '@'
          @comment.comment += char 
        end
      end
      @comment.commentable_id = params[:comment][:commentable_id]
      @comment.commentable_type = params[:comment][:commentable_type]
      @comment.user_id = params[:comment][:user_id]
      @comment.save
      UserMailer.send_comment_mentioned_email(mention_email, @comment).deliver
    else
      @comment = @commentable.comments.create comment_params
    end
  end

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