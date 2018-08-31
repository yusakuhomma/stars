class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
 # def _navbar
  #  @skills = Skill.pluck(:id)
   # @haveskills  = Haveskill.where(user_id: current_user.id).pluck(:skill_id)
   # @yet = @skills - @haveskills
  #  @yet_skills = Skill.find(@yet)
  #end
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
