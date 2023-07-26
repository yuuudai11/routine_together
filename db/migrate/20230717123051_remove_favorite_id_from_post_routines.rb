class RemoveFavoriteIdFromPostRoutines < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_routines, :favorite_id, :integer
  end
end
