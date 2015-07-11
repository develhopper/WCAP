class CreateDdts < ActiveRecord::Migration
  def change
    create_table :ddts do |t|

      t.timestamps
    end
  end
end
