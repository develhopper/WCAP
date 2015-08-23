class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true, null: false
      t.references :clinic, index: true, null: false
      t.references :patient, index: true, null: false

      t.timestamps
    end
  end
end
