class HaveskillsController < ApplicationController
    before_action :require_user_logged_in
    before_action :master_user
  
  def new
    @haveskills = Haveskill.all
    @set_haveskill = Haveskill.new
  end

def create
  
  @set_haveskill = Haveskill.new(haveskill_params)

    if @set_haveskill.save
      flash[:success] = '所持スキルを登録しました。'
      redirect_to new_haveskill_path
    else
      flash.now[:danger] = '所持スキルの登録に失敗しました。'
      render new_haveskill_path
    end
end

def edit
  @haveskill = Haveskill.find(params[:id])
end

def update
  @haveskill = Haveskill.find(params[:id])
  
  if @haveskill.update(edit_params)
          flash[:success] = '所持スキルを更新しました。'
          redirect_to edit_haveskill_path
        else
          flash[:danger] = '所持スキルの更新に失敗しました。'
          redirect_to edit_haveskill_path
  end
end

def destroy
    @haveskill = Haveskill.find(params[:id])
    @haveskill.destroy
    flash[:success] = '所持スキルを削除しました。'
    redirect_to master_path
    
end


private

def haveskill_params
    params.require(:haveskill).permit(:assessment,:user_id,:skill_id)
end


def edit_params
    params.require(:haveskill).permit(:assessment,:user_id,:skill_id)
end
end
