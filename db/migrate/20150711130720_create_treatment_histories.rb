class CreateTreatmentHistories < ActiveRecord::Migration
  def change
    create_table :treatment_histories do |t|
      t.references :patient, index: true
      t.boolean :is_cured
      t.boolean :in_month_treated
      t.integer :in_year_treat_count
      t.boolean :na_session
      t.integer :total

      t.timestamps
    end
  end
end
