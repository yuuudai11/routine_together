class Public::FavoritesController < ApplicationController
  def create
    @post_routine = PostRoutine.find(params[:id])
    @favorite = Favorite.new
    # (user_id: current_user.id, post_routine_id: @post_routine.id)
    @favorite.user_id = current_user.id
    @favorite.post_routine_id = @post_routine.id
    @favorite.save
    redirect_to public_post_routines_index_path
  end

  def destroy
    @post_routine = PostRoutine.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, post_routine_id: @post_routine.id)
    @favorite.destroy
    redirect_to public_post_routines_index_path
  end
end
