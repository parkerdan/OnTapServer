class AddUserToTaps < ActiveRecord::Migration
  def change
    add_reference :taps, :user, index: true, foreign_key: true
  end
end
