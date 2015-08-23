class CreateTestDetails < ActiveRecord::Migration
  def change
    create_table :test_details do |t|
      t.string :name
      t.integer :part_count
      t.references :study, index: true, null: false

      t.timestamps
    end
  end
end
