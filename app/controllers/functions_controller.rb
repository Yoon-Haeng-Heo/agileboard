class FunctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_function, only: %i(index show edit)
  
  def index
    @functions = Function.all
    @sort = @functions.ransack(params[:q])
    @sort_functions = @sort.result
  end

  def new
    @function = Function.new
  end
  
  def show
  end

  def create
    @function = Function.create function_params
    redirect_to functions_path
  end 

  def edit 
  end 

  def function_params
    params.require(:function).permit(:title, :description, :start_at, :end_at, :project_id, user_list: [], tag_list: [])
  end
  
  def load_function
    @function = Function.find_by(id: params[:id])
  end
end
