class CreateBarts < ActiveRecord::Migration
  def change
    create_table :barts do |t|

      t.timestamps
    end
  end
end
