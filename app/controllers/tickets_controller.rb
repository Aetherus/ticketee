class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]
  before_filter :authorize_edit!, :only => [:edit, :update]
  before_filter :authorize_delete!, :only => :destroy

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    if @ticket.save
      flash[:notice] = "Ticket has been created."
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
      @project = Project.for(current_user).find params[:project_id]
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The project you were looking for could not be found.'
      redirect_to root_path
    end
  end

  def find_ticket
    begin
      @ticket = @project.tickets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The ticket you were looking for could not be found.'
      redirect_to @project
    end
  end

  def authorize_create!
    authorize_action_on_project! "create tickets"
  end


  def authorize_edit!
    authorize_action_on_project! "edit tickets"
  end

  def authorize_delete!
    authorize_action_on_project! "delete tickets"
  end

  def authorize_action_on_project!(action)
    authorize_action! action, @project
  end

end
