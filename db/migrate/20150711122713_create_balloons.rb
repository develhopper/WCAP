class CreateBalloons < ActiveRecord::Migration
  def change
    create_table :balloons do |t|
      t.integer :pumps
      t.boolean :explosion
      t.integer :response_time
      t.references :bart, index: true

      t.timestamps
    end
  end
end
