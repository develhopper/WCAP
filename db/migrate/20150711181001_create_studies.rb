class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.references :admin, index: true, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
