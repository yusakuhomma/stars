class SkillsController < ApplicationController
  def index
    @categories = Category.order(created_at: :desc)
    @skills = Skill.order(created_at: :desc)
  end
  
  def show
    @skill = Skill.find(params[:id])
  end
end
