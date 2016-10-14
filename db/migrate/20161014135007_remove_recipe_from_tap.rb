class RemoveRecipeFromTap < ActiveRecord::Migration
  def change
    remove_column :taps, :recipe, :string
  end
end
