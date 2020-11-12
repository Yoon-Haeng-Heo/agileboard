class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :load_post, only: %i(show edit destroy)

  def index
    @posts = Post.all.page(params[:page]).per(9)
  end

  def new;end

  def show
    @comments = Comment.where(commentable_id: @post.id).page(params[:page]).per(3)
  end

  def create
    @post = current_user.posts.create post_params
    redirect_to root_path
  end 

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :project_id, :image, participant_list: [])
  end

  def load_post
    @post = Post.find_by(id: params[:id])
  end
end
