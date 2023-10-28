class Public::PostRoutinesController < ApplicationController
  def index
    @post_routine = PostRoutine.all
  end

  def study
    @post_routine = PostRoutine.all
    @study = PostRoutine.where(genre: "study")
  end

  def exercise
    @post_routine = PostRoutine.all
    @exercise = PostRoutine.where(genre: "exercise")
  end

  def others
    @post_routine = PostRoutine.all
    @others = PostRoutine.where(genre: "others")
  end

  def destroy
    @post_routine = PostRoutine.find(params[:id])
    if @post_routine.destroy
      flash[:notice] = "MY ROUTINEを削除しました"
      redirect_to public_users_show_path(current_user)
    else
      render :show
    end
  end

# 習慣の投稿データの保存
  def create
    @post_routine = PostRoutine.new(post_routine_params)
    @post_routine.user_id = current_user.id
    if @post_routine.save
      flash[:notice] = "MY ROUTINEを設定しました"
      redirect_to public_users_show_path(current_user)
    else
      flash[:notice] = "投稿に失敗しました。"
      redirect_to public_users_show_path(current_user)
    end
  end

  def update
    @post_routine = PostRoutine.find(params[:id])
    if @post_routine.update(post_routine_params)
      flash[:notice] = "MY ROUTINE編集成功"
      redirect_to public_users_show_path(current_user)
    else
      flash[:notice] = "編集に失敗しました。"
      render :edit
    end

  end

  def show
    @post_routine = PostRoutine.find(params[:id])
    @comment = Comment.new
    @comments = @post_routine.comments
  end

  def edit
    @post_routine = PostRoutine.find(params[:id])
  end

  def count_up
    @post_routine = PostRoutine.find(params[:id])
    @post_routine.increment!(:continue_days, 1)
    @post_routine.continue_days
    flash[:notice] = "達成！明日も頑張ろう"
    redirect_to public_users_show_path(current_user)
  end

  def count0
    @post_routine = PostRoutine.find(params[:id])
    @post_routine.update(continue_days:0)
    flash[:notice] = "残念でした（泣）。明日からまたスタートだ！"
    redirect_to public_users_show_path(current_user)
  end

  # 投稿データのストロングパラメータ
  private

  def post_routine_params
    params.require(:post_routine).permit(:routine_info, :user_id, :favorite_id,
    :status_id, :comment_id, :continue_days, :genre)
  end




end
