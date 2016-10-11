class RemoveTapNumberFromTap < ActiveRecord::Migration
  def change
    remove_column :taps, :tapNumber, :integer
  end
end
