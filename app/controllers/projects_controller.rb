class ProjectsController < ApplicationController
  before_action :load_project, only: %i(show)

  def index 
    @projects = Project.all
  end 
  
  def show
    @functions = @project.functions
  end

  private 

  def load_project
    @project = Project.find_by(id: params[:id])
  end 
end
