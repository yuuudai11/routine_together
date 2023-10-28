class Admin::CommentsController < ApplicationController
  # def index
  # end

  # def show
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @user = @comment.user_id
    redirect_to admin_user_path(@user)
  end
end
