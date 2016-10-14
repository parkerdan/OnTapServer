class AddShowRecipeToTap < ActiveRecord::Migration
  def change
    add_column :taps, :show_recipe, :boolean, default: true
  end
end
