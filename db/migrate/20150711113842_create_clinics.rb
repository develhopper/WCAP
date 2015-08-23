class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name, null: false
      t.references :supervisor, index: true, null: false

      t.timestamps
    end
  end
end
