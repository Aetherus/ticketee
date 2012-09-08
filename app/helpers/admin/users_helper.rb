module Admin::UsersHelper
  def myself?
    current_user.id == params[:id].to_i
  end
end
