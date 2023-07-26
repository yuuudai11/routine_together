class Public::UsersController < ApplicationController
  def index
  end

  def show
    @post_routine = PostRoutine.new
    # @users = User.new
    @user = User.find(params[:id])
    @post_routines = current_user.post_routines
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_users_show_path(@user)
  end

  def withdrawal
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :is_deleted, :image)
  end


end
