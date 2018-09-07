module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  def master_user
    unless current_user.id == 2
    redirect_to skills_path
    end
  end
end
