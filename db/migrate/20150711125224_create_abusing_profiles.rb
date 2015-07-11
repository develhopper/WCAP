class CreateAbusingProfiles < ActiveRecord::Migration
  def change
    create_table :abusing_profiles do |t|
      t.integer :cost_per_month
      t.integer :overdose_count
      t.integer :freakout_count
      t.references :patient, index: true

      t.timestamps
    end
  end
end
