class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.integer :routine_id,  null:false
      t.string  :status_name, null:false
      t.integer :days,        null:false

      t.timestamps
    end
  end
end
