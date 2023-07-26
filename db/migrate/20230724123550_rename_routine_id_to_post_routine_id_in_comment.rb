class RenameRoutineIdToPostRoutineIdInComment < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :routine_id, :post_routine_id
  end
end
