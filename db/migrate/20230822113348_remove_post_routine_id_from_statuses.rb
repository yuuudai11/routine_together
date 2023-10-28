class RemovePostRoutineIdFromStatuses < ActiveRecord::Migration[6.1]
  def change
    remove_column :statuses, :post_routine_id
  end
end
