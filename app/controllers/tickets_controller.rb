class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] =  "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render action: 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = 'Ticket has been updated.'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Ticket has not been updated.'
      render :action => 'edit'
    end
  end

  def destroy
    if @ticket.destroy
      flash[:notice] = 'Ticket has been deleted.'
      redirect_to @project
    else
      flash[:alert] = 'Ticket has not been deleted.'
      render :action => 'show'
    end
  end

  private
  def find_project
    begin
      @project = Project.find params[:project_id]
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def find_ticket
    begin
      @ticket = @project.tickets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to @project
    end
  end
end
