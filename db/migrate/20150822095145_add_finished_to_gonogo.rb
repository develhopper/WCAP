class AddFinishedToGonogo < ActiveRecord::Migration
  def change
    add_column :gonogos, :finished, :boolean
  end
end
