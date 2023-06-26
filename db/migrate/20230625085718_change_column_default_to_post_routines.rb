class ChangeColumnDefaultToPostRoutines < ActiveRecord::Migration[6.1]
  def change
    change_column_default :post_routines, :status_id, from: nil, to: "0"
  end
end
