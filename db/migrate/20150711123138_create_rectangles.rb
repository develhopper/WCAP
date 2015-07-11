class CreateRectangles < ActiveRecord::Migration
  def change
    create_table :rectangles do |t|
      t.integer :state
      t.boolean :is_clicked
      t.integer :display_time
      t.integer :response_time
      t.integer :reaction_time
      t.references :gonogo, index: true

      t.timestamps
    end
  end
end
