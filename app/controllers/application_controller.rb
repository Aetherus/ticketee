class ApplicationController < ActionController::Base
  protect_from_forgery

  CHECKED = '1'
  UNCHECKED = '0'

  protected
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def authorize_action!(action, thing)
    unless permitted_to? action, thing
      flash[:alert] = "You cannot #{action} #{action.to_s['delete'] ? 'from' : 'on'} this #{thing.class.to_s.humanize.downcase!}."
      redirect_to thing
    end
  end

  private
  def permitted_to?(action, thing)
    current_user.admin? || can?(action.to_sym, thing)
  end
end
