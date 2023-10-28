class Admin::UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @comment = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit([:email, :user_name, :is_deleted])
  end
end
