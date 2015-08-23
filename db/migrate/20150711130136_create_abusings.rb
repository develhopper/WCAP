class CreateAbusings < ActiveRecord::Migration
  def change
    create_table :abusings do |t|
      t.references :abusing_profile, index: true, null: false
      t.integer :drug_type
      t.integer :first_use_age
      t.integer :continuous_usage_duration
      t.integer :count
      t.integer :abusing_type
      t.text :description
      t.boolean :is_mainspring, null: false, default: false

      t.timestamps
    end
  end
end
