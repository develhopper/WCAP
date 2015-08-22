class AddFinishedToBart < ActiveRecord::Migration
  def change
    add_column :barts, :finished, :boolean
  end
end
