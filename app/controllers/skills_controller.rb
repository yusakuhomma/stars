class SkillsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @categories = Category.order(created_at: :desc)
    @skills = Skill.order(created_at: :desc)
  end
  
  def show
    @skill = Skill.find(params[:id])
  end
  
  def new
    @skill = Skill.new
  end
  
  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id

    if @skill.save
      flash[:success] = 'スキルを登録しました。'
      redirect_to new_skill_path
    else
      flash.now[:danger] = 'スキルの登録に失敗しました。'
      render :new
    end
  end
  
  def search 
  @name = params[:search]
  @results = Skill.where('name LIKE ?', "%#{params[:search]}%")
  @categories = Category.order(created_at: :desc)
  @skills = Skill.order(created_at: :desc)
  end
  
  private

  def skill_params
    params.require(:skill).permit(:name, :category_id, :user_id)
  end
end
