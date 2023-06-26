class Public::PostRoutinesController < ApplicationController
  def index
  end

  def destroy
  end
# 習慣の投稿データの保存
  def create
    @post_routine = PostRoutine.new(post_routine_params)
    @post_routine.user_id = current_user.id
    @post_routine.save
    redirect_to root_path
  end

  def update
  end

  def show
  end

  def edit
  end

  # 投稿データのストロングパラメータ
  private

  def post_routine_params
    params.require(:post_routine).permit(:routine_info)
  end


end
