class Public::UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top, :about]

  def index
  end

  def show
    @post_routine = PostRoutine.new
    # @users = User.new
    @user = User.find(params[:id])
    @post_routines = @user.post_routines

    max_day = @post_routines.order(continue_days: :desc).first # 最も頑張った習慣の長い日付を1件取得する
    if max_day.present?
      @status = Status.find_by(days: max_day.continue_days) # 最も頑張った習慣の日付をStatusテーブルから検索して1件取得
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザは編集できません"
      redirect_to public_users_edit_path(current_user)

    elsif @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to public_users_show_path(@user)

    else
      flash[:notice] = "編集に失敗しました。空白、１０文字以上の名前、同一の名前は使用できません。"
      render :edit
    end
  end

  # def withdrawal
  # end

  def withdraw
    @user = current_user
    if @user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザは退会できません"
      redirect_to public_users_edit_path(current_user)
    else
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :is_deleted, :image)
  end


end
