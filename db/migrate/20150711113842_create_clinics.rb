class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.references :supervisor, index: true

      t.timestamps
    end
  end
end
