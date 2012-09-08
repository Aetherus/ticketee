class Admin::UsersController < Admin::BaseController
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
    admin = params[:user].delete(:admin) == '1'
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
end
