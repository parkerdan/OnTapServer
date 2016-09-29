class CreateTaps < ActiveRecord::Migration
  def change
    create_table :taps do |t|
      t.string :title
      t.string :description
      t.integer :imageId
      t.integer :tapNumber
      t.references :bar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
