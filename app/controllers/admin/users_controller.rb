class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all(:order => :email)
  end

  def new
    @user = User.new
  end

  def create
    # Although the keys in params and params[:user]
    # are actually strings, not symbols,
    # you can still access the values via symbol keys
    # because HashWithIndifferentAccess (the type of params) do the
    # conversion from symbols to strings for you.
    # This is what the word 'Indifferent' means.
    admin = params[:user].delete(:admin) == CHECKED
    @user = User.new(params[:user])
    @user.admin = admin
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => 'new'
    end
  end

  def show

  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user.admin = params[:user].delete(:admin) == CHECKED

    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been updated."
      render :action => 'edit'
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
      render :action => 'show'
    end

    if @user.destroy
      flash[:notice] = "User has been deleted."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been deleted."
      render :action => 'show'
    end
  end

  private
  def find_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The user you were looking for could not be found."
      redirect_to admin_users_path
    end
  end

end
