class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.references :admin, index: true
      t.text :description

      t.timestamps
    end
  end
end
