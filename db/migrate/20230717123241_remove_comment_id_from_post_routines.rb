class RemoveCommentIdFromPostRoutines < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_routines, :comment_id, :integer
  end
end
