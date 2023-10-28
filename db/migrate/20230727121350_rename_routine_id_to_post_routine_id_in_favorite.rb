class RenameRoutineIdToPostRoutineIdInFavorite < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :routine_id, :post_routine_id
  end
end
