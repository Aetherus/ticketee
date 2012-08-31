class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
    #flash[:notice] = "Project has been created."
    #redirect_to @project
    #The code above can be shortened as:
      redirect_to @project, notice: "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render action: "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render action: 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      redirect_to projects_path, notice: "Project has been deleted."
    else
      flash[:alert] = "Project has not been deleted."
      render action: 'show'
    end
  end
end
