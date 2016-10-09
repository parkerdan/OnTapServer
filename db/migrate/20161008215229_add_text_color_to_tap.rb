class AddTextColorToTap < ActiveRecord::Migration
  def change
    add_column :taps, :text_color, :string
  end
end
