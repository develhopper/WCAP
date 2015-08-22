class AddFinishedToDdt < ActiveRecord::Migration
  def change
    add_column :ddts, :finished, :boolean
  end
end
