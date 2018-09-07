class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :master_user
def new
    @categories = Category.all
    @set_category = Category.new
end

def create
  
  @set_category = Category.new(category_params)

    if @set_category.save
      flash[:success] = 'カテゴリーを登録しました。'
      redirect_to new_category_path
    else
      flash.now[:danger] = 'カテゴリーの登録に失敗しました。'
      render new_category_path
    end
end

def edit
  @category = Category.find(params[:id])
end

def update
  @category = Category.find(params[:id])
  
  if @category.update(edit_params)
          flash[:success] = 'カテゴリーを更新しました。'
          redirect_to edit_category_path
        else
          flash[:danger] = 'カテゴリーの更新に失敗しました。'
          redirect_to edit_category_path
  end
end

def destroy
    @category = Category.find(params[:id])
  if @category.skills.count < 1
    @category.destroy
    flash[:success] = 'カテゴリーを削除しました。'
    redirect_to master_path
  else
    flash[:danger] = '他のスキルと紐づいているため削除できません。'
    redirect_to edit_category_path
  end
end

private

def category_params
    params.require(:category).permit(:name,:display)
end

def edit_params
    params.require(:category).permit(:name, :display)
end

end
