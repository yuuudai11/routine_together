class ChangeColumnDefaultContinueDaysOnPostRoutines < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:post_routines, :continue_days, from: nil, to: 0)
  end
end
