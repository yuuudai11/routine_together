class RenameRoutineIdToPostRoutineIdInStatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :statuses, :routine_id, :post_routine_id
  end
end
