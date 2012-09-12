class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.for(current_user).all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
      # The code above can be shortened as:
      # redirect_to @project, :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render action: "new"
    end
  end

  def show

  end


  def edit

  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render action: 'edit'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project has been deleted."
    else
      flash[:alert] = "Project has not been deleted."
      render action: 'show'
    end
  end

  private
  def find_project
    begin
      @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The project you were looking for could not be found.'
      redirect_to projects_path, :alert => "The project you were looking for could not be found."
    end
  end
end
