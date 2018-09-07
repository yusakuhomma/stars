class SkillsController < ApplicationController
  before_action :require_user_logged_in
  before_action :master_user, only: [:edit,:update,:destroy]
  def index
    @categories = Category.order(display: :asc)
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
  
  def edit
  @skill = Skill.find(params[:id])
end

def update
  @skill = Skill.find(params[:id])
  
  if @skill.update(edit_params)
          flash[:success] = 'スキルを更新しました。'
          redirect_to edit_skill_path
        else
          flash[:danger] = 'スキルの更新に失敗しました。'
          redirect_to edit_skill_path
  end
end
  
def destroy
    @skill = Skill.find(params[:id])
    if @skill.haveskills.count < 1
    @skill.destroy
    flash[:success] = 'スキルを削除しました。'
    redirect_to master_path
    else
    flash[:danger] = '他の所持スキルと紐づいているため削除できません。'
    redirect_to edit_skill_path
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
  
  def edit_params
    params.require(:skill).permit(:name, :category_id,:user_id,:display)
end
end
