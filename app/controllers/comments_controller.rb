class CommentsController < ApplicationController
  before_action :load_commentable, only: %i(create)
  before_action :load_comment, only: %i(destroy)
  
  def create
    mentionee = params[:comment][:comment].split(/[@]+/).each {|name| [name]}
    while mentionee.include?("")
      mentionee.delete_at(mentionee.index(""))
    end
    mentionee = mentionee.map do |name| name.rstrip end
    tmp = []
    mentionee.each do |name|
      # 여기서 멘션 작업할 것
      tmp << User.ransack(name_cont: name).result
    end
    @comment = @commentable.comments.create comment_params
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