class RemoveStatusIdFromPostRoutines < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_routines, :status_id, :integer
  end
end
