class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true
      t.references :clinic, index: true
      t.references :patient, index: true

      t.timestamps
    end
  end
end
