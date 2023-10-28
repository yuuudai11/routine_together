class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post_routine = PostRoutine.find(params[:id])
    @comment.user_id = current_user.id
    @comment.post_routine_id = @post_routine.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to public_post_routines_show_path(@post_routine)
    else
      flash[:notice] = "コメントの投稿に失敗しました"
      redirect_to public_post_routines_show_path(@post_routine)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post_routine = @comment.post_routine_id
    redirect_to public_post_routines_show_path(@post_routine)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
