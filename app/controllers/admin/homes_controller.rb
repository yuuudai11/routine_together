class Admin::HomesController < ApplicationController
  def top
    @post_routine = PostRoutine.all
    @user = User.page(params[:page])
  end
end
