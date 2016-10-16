class AddSubscriptionIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscription_id, :string, default: ""
  end
end
