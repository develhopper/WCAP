class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :study, index: true, null: false
      t.references :patient, index: true, null: false

      t.timestamps
    end
  end
end
