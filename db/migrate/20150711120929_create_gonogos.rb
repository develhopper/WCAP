class CreateGonogos < ActiveRecord::Migration
  def change
    create_table :gonogos do |t|

      t.timestamps
    end
  end
end
