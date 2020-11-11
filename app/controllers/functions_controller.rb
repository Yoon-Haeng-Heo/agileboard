class FunctionsController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  
  def index
  end

  def new
  end
  
  def show
  end

  def create
    @function = Function.create function_params
    redirect_to root_path
  end 

  def function_params
    params.require(:function).permit(:title, :description, :start_at, :end_at, :project_id, user_list: [], tag_list: [])
  end
end
