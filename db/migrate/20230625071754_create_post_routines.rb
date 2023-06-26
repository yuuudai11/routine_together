class CreatePostRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :post_routines do |t|

      t.integer :user_id,       null: false
      t.integer :favorite_id,   null: false
      t.integer :comment_id,    null: false
      t.integer :status_id,     null: false
      t.integer :continue_days, null: false
      t.text    :routine_info,  null: false
      t.integer :genre,         null: false

      t.timestamps
    end
  end
end
