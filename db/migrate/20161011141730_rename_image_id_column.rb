class RenameImageIdColumn < ActiveRecord::Migration
  def change
    rename_column :taps, :imageId, :image_id
  end
end
