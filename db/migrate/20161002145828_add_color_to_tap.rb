class AddColorToTap < ActiveRecord::Migration
  def change
    add_column :taps, :color, :string
  end
end
