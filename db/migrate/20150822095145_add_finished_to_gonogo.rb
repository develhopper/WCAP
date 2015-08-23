class AddFinishedToGonogo < ActiveRecord::Migration
  def change
    add_column :gonogos, :finished, :boolean, :default => false, :null => false
  end
end
