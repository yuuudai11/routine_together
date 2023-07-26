class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post_routine = PostRoutine.find(params[:id])
    @comment.user_id = current_user.id
    @comment.post_routine_id = @post_routine.id
    @comment.save
    redirect_to public_post_routines_show_path(@post_routine)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to public_users_show_path(current_user)
  end


  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
