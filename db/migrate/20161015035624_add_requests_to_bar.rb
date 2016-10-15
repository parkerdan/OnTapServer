class AddRequestsToBar < ActiveRecord::Migration
  def change
    add_column :bars, :requests, :integer, default: 0
  end
end
