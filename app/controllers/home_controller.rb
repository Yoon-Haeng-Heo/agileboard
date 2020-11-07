class HomeController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(4)
  end
end
