class Public::UsersController < ApplicationController
  def index
  end

  def show
    @post_routine = PostRoutine.new
    @user = current_user
  end

  def edit
  end

  def update
  end

  def withdrawal
  end

  def withdraw
  end
end
