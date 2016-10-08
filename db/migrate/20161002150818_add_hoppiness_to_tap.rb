class AddHoppinessToTap < ActiveRecord::Migration
  def change
    add_column :taps, :hoppiness, :integer
  end
end
