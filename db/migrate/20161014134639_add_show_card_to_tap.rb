class AddShowCardToTap < ActiveRecord::Migration
  def change
    add_column :taps, :show_card, :boolean, default: true
  end
end
