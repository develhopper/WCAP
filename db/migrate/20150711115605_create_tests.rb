class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :task, index: true
      t.integer :execution_schedule
      t.actable

      t.timestamps
    end
  end
end
