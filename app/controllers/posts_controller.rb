class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :load_post, only: %i(show edit destroy)

  def index
  end

  def new;end

  def show;end

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
