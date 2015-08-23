class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :study, index: true
      t.references :patient, index: true

      t.timestamps
    end
  end
end
