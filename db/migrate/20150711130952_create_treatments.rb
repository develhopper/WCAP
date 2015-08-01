class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :treatment_history, index: true
      t.integer :treatment_type
      t.integer :count
      t.integer :max_avoidance_day
      t.text :description
      t.integer :in_month_used

      t.timestamps
    end
  end
end
