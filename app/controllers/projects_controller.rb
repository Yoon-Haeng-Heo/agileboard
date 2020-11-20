class ProjectsController < ApplicationController
  before_action :load_project, only: %i(show)

  def index 
    @projects = Project.all
  end 
  
  def show
    @functions = @project.functions
    @function_per_user = []
    @project.users.each do |user|
      @function_per_user << [user.name, @project.functions.tagged_with(user.id).count ]
    end

    @sort = @functions.ransack(params[:q])
    @sort_functions = @sort.result
  end

  private 

  def load_project
    @project = Project.find_by(id: params[:id])
  end 
end
