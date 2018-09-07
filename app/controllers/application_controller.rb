class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  


  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def unrequire_user_logged_in
    if logged_in?
      redirect_to skills_path
    end
  end
end
