class AddFinishedToDdt < ActiveRecord::Migration
  def change
    add_column :ddts, :finished, :boolean, :default => false, :null => false
  end
end
