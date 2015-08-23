class CreateStroops < ActiveRecord::Migration
  def change
    create_table :stroops do |t|
      t.integer :duration
      t.integer :total_items
      t.integer :correct_items
      t.boolean :finished, null: false, default: false

      t.timestamps
    end
  end
end
