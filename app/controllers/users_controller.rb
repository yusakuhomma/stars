class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :all_skills,:edit,:update,:all_skills,:yet_skills,:set_skill]
  before_action :correct_user, only: [:edit,:update,:all_skills, :yet_skills, :set_skill]
  
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def update
        @user = User.find(current_user.id)
        
        if @user.update(edit_params)
          flash[:success] = 'ユーザ情報を更新しました。'
          redirect_to @user
        else
          flash[:danger] = 'ユーザ情報の更新に失敗しました。'
          render :edit
      end
  end
  
  def all_skills
    @user = User.find(params[:id])
    @categories = Category.order(created_at: :desc)
    @skills = Skill.order(created_at: :desc)

    
  end

  def yet_skills
    @user = User.find(params[:id])
    @skills = Skill.pluck(:id)
    @haveskills  = Haveskill.where(user_id: current_user.id).pluck(:skill_id)
    @yet = @skills - @haveskills
    @yet_skills = Skill.where(id: @yet)
    @categories = Category.order(created_at: :desc)
  end
  
  def set_skill
    skill = params[:skill]
    assessment = params[:assessment]

    
    skillset = current_user.haveskills.find_by(skill_id: skill)
    if (skillset == nil)
      
        skillset = current_user.haveskills.build(skill_id: skill, assessment: assessment)
        if (skillset.save)
              redirect_back(fallback_location: root_path)
              return;
        else
          flash.now[:danger] = 'スキルの登録に失敗しました。'
              redirect_back(fallback_location: root_path)
              return;
        end
    else
      if (skillset.update(skill_id: skill, assessment: assessment))
        redirect_back(fallback_location: root_path)
        return;
      else
        flash.now[:danger] = 'スキルの登録に失敗しました。'
        redirect_back(fallback_location: root_path)
        return;
      end
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :department_id, :extension_number, :password, :password_confirmation)
  end
  
  def edit_params
    params.require(:user).permit(:name, :email, :department_id, :extension_number)
  end
  
  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user == current_user
    flash[:danger] = 'その操作はできません'
      redirect_to skills_path
    end
  end
end
  

