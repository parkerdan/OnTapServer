class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
