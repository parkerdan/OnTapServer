class AddRecipeWithDefaultToTap < ActiveRecord::Migration
  def change
    add_column :taps, :recipe, :string, default: ""
  end
end
