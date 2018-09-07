class DepartmentsController < ApplicationController
    before_action :require_user_logged_in
    before_action :master_user
  
def new
    @departments = Department.all
    @set_department = Department.new
end

def create
  
  @set_department = Department.new(department_params)

    if @set_department.save
      flash[:success] = '所属を登録しました。'
      redirect_to new_department_path
    else
      flash.now[:danger] = '所属の登録に失敗しました。'
      render new_department_path
    end
end

def edit
  @department = Department.find(params[:id])
end

def update
  @department = Department.find(params[:id])
  
  if @department.update(edit_params)
          flash[:success] = '所属を更新しました。'
          redirect_to edit_department_path
        else
          flash[:danger] = '所属の更新に失敗しました。'
          redirect_to edit_department_path
  end
end

def destroy
    @department = Department.find(params[:id])
    if @department.users.count < 1
    @department.destroy
    flash[:success] = '所属を削除しました。'
    redirect_to master_path
    else
    flash[:danger] = '他のユーザーと紐づいているため削除できません。'
    redirect_to edit_department_path
  end
end


private

def department_params
    params.require(:department).permit(:name,:display)
end


def edit_params
    params.require(:department).permit(:name, :display)
end
end
