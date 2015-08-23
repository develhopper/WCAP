class AddFinishedToBart < ActiveRecord::Migration
  def change
    add_column :barts, :finished, :boolean, :default => false, :null => false
  end
end
