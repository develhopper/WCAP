class CreateTestDetails < ActiveRecord::Migration
  def change
    create_table :test_details do |t|
      t.string :name
      t.integer :count
      t.integer :part_count
      t.references :study, index: true

      t.timestamps
    end
  end
end
