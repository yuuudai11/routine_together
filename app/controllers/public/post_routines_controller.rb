class Public::PostRoutinesController < ApplicationController
  def index
    @post_routine = PostRoutine.all
  end

  def destroy
    @post_routine = PostRoutine.find(params[:id])
    @post_routine.destroy
    redirect_to public_users_show_path(current_user)
  end

# 習慣の投稿データの保存
  def create
    @post_routine = PostRoutine.new(post_routine_params)
    @post_routine.user_id = current_user.id
    @post_routine.save
    redirect_to public_users_show_path(current_user)
  end

  def update
    @post_routine = PostRoutine.find(params[:id])
    @post_routine.update(post_routine_params)
    redirect_to public_users_show_path(current_user)
  end

  def show
    @post_routine = PostRoutine.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @post_routine = PostRoutine.find(params[:id])
  end

  # 投稿データのストロングパラメータ
  private

  def post_routine_params
    params.require(:post_routine).permit(:routine_info, :user_id, :favorite_id,
    :status_id, :comment_id, :continue_days, :genre)
  end


end
